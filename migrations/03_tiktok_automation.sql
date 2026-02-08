-- Create table for TikTok content queue
CREATE TABLE IF NOT EXISTS tiktok_content_queue (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    concept TEXT NOT NULL,
    logic_hero TEXT NOT NULL,
    status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'processing', 'completed', 'failed')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    video_url TEXT
);

-- Initial seeds for logic content
INSERT INTO tiktok_content_queue (concept, logic_hero) VALUES
('Verkeerde tang gebruiken bij het strippen van kabels', 'Navid'),
('Metalen boor gebruiken voor hout op hoge snelheid', 'Juan'),
('Zwarte draad als aarding gebruiken (gevaarlijk!)', 'Matteo');
