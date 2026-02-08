
import re
import csv
import os
from datetime import datetime

# Define paths
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
STUDENTS_SQL = os.path.join(BASE_DIR, 'setup_students.sql')
SHOP_SQL = os.path.join(BASE_DIR, 'setup_shop.sql')
OUTPUT_DIR = os.path.join(BASE_DIR, 'glide_exports')

# Ensure output directory exists
os.makedirs(OUTPUT_DIR, exist_ok=True)

def parse_students():
    students = []
    initial_xp_logs = []
    
    with open(STUDENTS_SQL, 'r') as f:
        content = f.read()

    # Regex to find insert statements. 
    # Handles simple values: ('Name', 'Class') and with XP: ('Name', 'Class', 36)
    # This is a basic parser tailored to the known file structure.
    
    # 1. Standard inserts: insert into students (name, class) values ...
    # We look for the values block
    
    # Find block for standard students
    standard_pattern = r"insert into students \(name, class\) values\s+((?:\([^)]+\),?\s*)+);"
    standard_matches = re.search(standard_pattern, content, re.DOTALL | re.IGNORECASE)
    
    if standard_matches:
        values_block = standard_matches.group(1)
        # simplistic splitting by ),( might fail if text contains it, but for this data it's likely fine
        # Better: use regex to iterate over tuples
        tuple_pattern = r"\('([^']+)',\s*'([^']+)'\)"
        for match in re.finditer(tuple_pattern, values_block):
            name, cls = match.groups()
            students.append({'Name': name, 'Class': cls})

    # 2. Inserts with specific XP (e.g. Juan)
    # insert into students (name, class, xp_veiligheid) values ...
    xp_pattern = r"insert into students \(name, class, xp_([a-z]+)\) values\s+((?:\([^)]+\),?\s*)+);"
    for match in re.finditer(xp_pattern, content, re.DOTALL | re.IGNORECASE):
        category_slug = match.group(1)
        values_block = match.group(2)
        
        # Map slug to Proper Category Name
        category_map = {
            'veiligheid': 'Veiligheid',
            'metaal': 'Metaal',
            'werkhouding': 'Werkhouding',
            'teamwork': 'Teamwork',
            'creatief': 'Creatief',
            'nauwkeurigheid': 'Veiligheid' # Fallback/Alias if needed
        }
        category = category_map.get(category_slug, category_slug.capitalize())
        
        # Parse tuple: ('Juan', 'OV4', 36)
        # Note: XP value is a number, so no quotes
        tuple_match = r"\('([^']+)',\s*'([^']+)',\s*(\d+)\)"
        for tm in re.finditer(tuple_match, values_block):
            name, cls, xp = tm.groups()
            students.append({'Name': name, 'Class': cls})
            
            # Create Log Entry
            initial_xp_logs.append({
                'Leerling': name,
                'Categorie': category,
                'XP': xp,
                'BundelID': 'INIT', # Special bundle for initial carry-over
                'Datum': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
                'Note': 'Initial Import from SQL',
                'Foto': ''
            })

    # 3. Handle simple single line inserts if they were missed by the block regex (like the OV4 block at end)
    # The previous regexes might miss the OV4 block if it's separate.
    # Let's try a more generic line-by-line approach for any 'values' lines that look like student data
    # if we want to be very robust. But the above covers the current file structure well.
    # Let's double check the "OV4" block in the file provided in context.
    # It has: insert into students (name, class) values ('Mathis', 'OV4')...
    # This matches the first pattern if we apply it globally (findall instead of search)
    
    # Re-running standard pattern with findall to catch multiple blocks
    students = [] # Reset to avoid dupes if we change logic
    
    # Generic finder for (name, class) tables
    std_blocks = re.findall(standard_pattern, content, re.DOTALL | re.IGNORECASE)
    for block in std_blocks:
        tuple_pattern = r"\('([^']+)',\s*'([^']+)'\)"
        for match in re.finditer(tuple_pattern, block):
            name, cls = match.groups()
            students.append({'Name': name, 'Class': cls})
            
    # Then add the XP ones
    # (Juan is in a separate block with 3 columns)
    # We already got him in previous logic? Let's re-run that logic safely.
    
    # Helper to not add duplicate students by name
    seen_names = set(s['Name'] for s in students)
    
    for match in re.finditer(xp_pattern, content, re.DOTALL | re.IGNORECASE):
        category_slug = match.group(1)
        values_block = match.group(2)
        
        category_map = {
            'veiligheid': 'Veiligheid',
            # ... others ...
        }
        category = category_map.get(category_slug, category_slug.capitalize())
        
        tuple_match = r"\('([^']+)',\s*'([^']+)',\s*(\d+)\)"
        for tm in re.finditer(tuple_match, values_block):
            name, cls, xp = tm.groups()
            if name not in seen_names:
                students.append({'Name': name, 'Class': cls})
                seen_names.add(name)
            
            initial_xp_logs.append({
                'Leerling': name,
                'Categorie': category,
                'XP': xp,
                'BundelID': 'INIT',
                'Datum': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
                'Note': 'Initial Import from SQL',
                'Foto': ''
            })
            
    return students, initial_xp_logs

def parse_shop():
    products = []
    with open(SHOP_SQL, 'r') as f:
        content = f.read()

    # insert into products (title, description, price_xp, type, image_url) values ...
    # Pattern: ('Title', 'Desc', 500, 'physical', 'url')
    # Note: Description might have commas? The simple regex assumes no escaped quotes for now.
    
    # Find the values block
    pattern = r"insert into products \(title, description, price_xp, type, image_url\) values\s+((?:\([^)]+\),?\s*)+);"
    match = re.search(pattern, content, re.DOTALL | re.IGNORECASE)
    
    if match:
        values_block = match.group(1)
        # Split by `),` carefully or rely on regex
        # regex: \('([^']*)', '([^']*)', (\d+), '([^']*)', '([^']*)'\)
        # Note: Description in SQL might contain newlines or be long.
        
        item_pattern = r"\('([^']*)', '([^']*)', (\d+), '([^']*)', '([^']*)'\)"
        for item in re.finditer(item_pattern, values_block):
            title, desc, price, ptype, img = item.groups()
            products.append({
                'Title': title,
                'Description': desc,
                'Price_XP': price,
                'Image_URL': img
            })
            
    return products

def write_csv(filename, fieldnames, data):
    path = os.path.join(OUTPUT_DIR, filename)
    with open(path, 'w', newline='', encoding='utf-8') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(data)
    print(f"Generated {path}")

def main():
    print("Parsing SQL files...")
    students, xp_logs = parse_students()
    products = parse_shop()
    
    # 1. Write Students
    # Add empty columns for Glide: Status, Heldentitel, Avatar_URL, Hero_BundelID
    student_rows = []
    for s in students:
        row = s.copy()
        row['Status'] = 'Nothing' # Default badge
        row['Heldentitel'] = ''
        row['Avatar_URL'] = ''   # Placeholder
        row['Hero_BundelID'] = ''
        student_rows.append(row)
        
    write_csv('glide_students.csv', 
              ['Name', 'Class', 'Status', 'Heldentitel', 'Avatar_URL', 'Hero_BundelID'], 
              student_rows)
    
    # 2. Write Shop
    write_csv('glide_shop.csv', 
              ['Title', 'Description', 'Price_XP', 'Image_URL'], 
              products)
    
    # 3. Write XP Logs
    write_csv('glide_xp_log.csv', 
              ['Leerling', 'Categorie', 'XP', 'BundelID', 'Datum', 'Note', 'Foto'], 
              xp_logs)
              
    # 4. Write Bundles (Seed data)
    bundles = [
        {'BundelID': 'B001', 'Naam': 'Start Bundel', 'Actief': 'TRUE'},
        {'BundelID': 'INIT', 'Naam': 'Initial Import', 'Actief': 'FALSE'}
    ]
    write_csv('glide_bundles.csv', 
              ['BundelID', 'Naam', 'Actief'], 
              bundles)

    print("Done! Files are in:", OUTPUT_DIR)

if __name__ == "__main__":
    main()
