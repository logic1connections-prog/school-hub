import { defineConfig } from 'vite';
import { resolve } from 'path';

export default defineConfig({
    root: '.',
    build: {
        rollupOptions: {
            input: {
                main: resolve(__dirname, 'index.html'),
                admin: resolve(__dirname, 'admin.html'),
                quiz: resolve(__dirname, 'quiz.html'),
                login: resolve(__dirname, 'login.html'),
                register: resolve(__dirname, 'register.html'),
                challenges: resolve(__dirname, 'challenges.html'),
                leaderboard: resolve(__dirname, 'leaderboard.html'),
                shop: resolve(__dirname, 'shop.html'),
                seed: resolve(__dirname, 'seed.html')
            }
        }
    }
});
