const CACHE_NAME = 'school-hub-v1';
const ASSETS = [
    '/',
    '/index.html',
    '/login.html',
    '/login_verify.html',
    '/register.html',
    '/admin.html',
    '/quiz.html',
    '/passport.html',
    '/challenges.html',
    '/map.html',
    '/leaderboard.html',
    '/css/style.css',
    '/js/supabase.js',
    '/assets/icon.png',
    // Heroes
    '/assets/heroes/juan.png',
    '/assets/heroes/navid.png',
    '/assets/heroes/matteo.png',
    '/assets/heroes/jaren.png',
    '/assets/heroes/milan.png',
    '/assets/heroes/sam.png',
    '/assets/heroes/godfather.png',
    '/assets/heroes/madness.png',
    // Sounds
    '/assets/sounds/correct.mp3',
    '/assets/sounds/wrong.mp3',
    '/assets/sounds/finish.mp3'
];

self.addEventListener('install', (event) => {
    event.waitUntil(
        caches.open(CACHE_NAME).then((cache) => {
            return cache.addAll(ASSETS);
        })
    );
});

self.addEventListener('activate', (event) => {
    event.waitUntil(
        caches.keys().then((keys) => {
            return Promise.all(keys
                .filter(key => key !== CACHE_NAME)
                .map(key => caches.delete(key))
            );
        })
    );
});

self.addEventListener('fetch', (event) => {
    event.respondWith(
        caches.match(event.request).then((response) => {
            return response || fetch(event.request);
        })
    );
});
