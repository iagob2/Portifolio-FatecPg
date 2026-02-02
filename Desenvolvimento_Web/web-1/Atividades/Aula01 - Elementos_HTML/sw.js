// ============================================
// SERVICE WORKER PARA PWA
// ============================================

const CACHE_NAME = 'html5-manual-v1';
const urlsToCache = [
    './',
    './index.html',
    './styles.css',
    './script.js',
    './manifest.json'
];

// Instalação do Service Worker
self.addEventListener('install', function (event) {
    event.waitUntil(
        caches.open(CACHE_NAME)
            .then(function (cache) {
                console.log('Cache aberto');
                return cache.addAll(urlsToCache);
            })
    );
});

// Interceptação de requisições
self.addEventListener('fetch', function (event) {
    event.respondWith(
        caches.match(event.request)
            .then(function (response) {
                // Retorna do cache se disponível, senão busca na rede
                if (response) {
                    return response;
                }
                return fetch(event.request).then(
                    function (response) {
                        // Verifica se recebemos uma resposta válida
                        if (!response || response.status !== 200 || response.type !== 'basic') {
                            return response;
                        }

                        // Clona a resposta
                        const responseToCache = response.clone();

                        caches.open(CACHE_NAME)
                            .then(function (cache) {
                                cache.put(event.request, responseToCache);
                            });

                        return response;
                    }
                );
            })
            .catch(function () {
                // Retorna página offline se disponível
                return caches.match('./index.html');
            })
    );
});

// Atualização do Service Worker
self.addEventListener('activate', function (event) {
    const cacheWhitelist = [CACHE_NAME];

    event.waitUntil(
        caches.keys().then(function (cacheNames) {
            return Promise.all(
                cacheNames.map(function (cacheName) {
                    if (cacheWhitelist.indexOf(cacheName) === -1) {
                        return caches.delete(cacheName);
                    }
                })
            );
        })
    );
});
