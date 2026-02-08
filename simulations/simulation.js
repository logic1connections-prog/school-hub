import { createClient } from 'https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/+esm'

export class SimulationManager {
    constructor(supabaseUrl, supabaseKey) {
        this.supabase = createClient(supabaseUrl, supabaseKey);
        this.machineType = 'unknown';
        this.user = null;
    }

    setMachineType(type) {
        this.machineType = type;
    }

    checkAuth() {
        // 1. Try to get from LocalStorage (School Hub Simple Auth)
        const storedUser = localStorage.getItem('schoolHubUser');
        if (storedUser) {
            this.user = JSON.parse(storedUser);
            console.log("User logged in:", this.user.name);
            return this.user;
        }

        // 2. If not found, redirect to login
        console.warn("No user found in localStorage. Redirecting...");
        // Check if we are in a subdirectory
        if (window.location.pathname.includes('/simulations/')) {
            window.location.href = '../../login.html';
        } else {
            window.location.href = 'login.html';
        }
        return null;
    }

    async saveResult(moduleType, score) {
        if (!this.user) {
            this.checkAuth();
            if (!this.user) return;
        }

        console.log(`Saving result for ${this.user.name}: ${moduleType} = ${score}`);

        const { data, error } = await this.supabase
            .from('simulation_results')
            .insert([
                {
                    user_id: this.user.id, // Assumes 'students' table has UUIDs matching auth.users or we use this ID directly
                    machine_type: this.machineType,
                    module_type: moduleType,
                    score: score
                }
            ]);

        if (error) {
            console.error("Error saving result:", error);
            // Fallback: If the user ID in localStorage is NOT a valid UUID for auth.users, 
            // this might fail if the table references auth.users.
            // But based on login.html, 'students' table seems to be the source.
            // We might need to adjust the table schema if foreign key fails.
            alert("Kon resultaat niet opslaan. Ben je ingelogd?");
            return null;
        }

        console.log("Result saved successfully!");
        // Show a small notification
        const flash = document.createElement('div');
        flash.style.position = 'fixed';
        flash.style.top = '20px';
        flash.style.right = '20px';
        flash.style.background = '#00ff9d';
        flash.style.color = '#000';
        flash.style.padding = '10px 20px';
        flash.style.borderRadius = '8px';
        flash.style.zIndex = '10000';
        flash.style.fontWeight = 'bold';
        flash.textContent = 'Resultaat Opgeslagen! 💾';
        document.body.appendChild(flash);
        setTimeout(() => flash.remove(), 3000);

        return data;
    }
}
