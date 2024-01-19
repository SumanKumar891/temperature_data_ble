'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "80b8084792063c2ae8c4220a3dd782dc",
"index.html": "5392321600f736696e17442d95e9302e",
"/": "5392321600f736696e17442d95e9302e",
"main.dart.js": "412415b1cd9d13450b75e8b3b757111b",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"favicon.png": "9299e21d4e19fca65f4715ca2bae6641",
"icons/Icon-192.png": "9299e21d4e19fca65f4715ca2bae6641",
"icons/Icon-maskable-192.png": "9299e21d4e19fca65f4715ca2bae6641",
"icons/Icon-maskable-512.png": "9299e21d4e19fca65f4715ca2bae6641",
"icons/Icon-512.png": "9299e21d4e19fca65f4715ca2bae6641",
"manifest.json": "8e27deb9742ad250d9b34f42f1008070",
"assets/images/login.png": "b56ef485cbc7f4f4f5269dd2abff6124",
"assets/images/wall1.webp": "f022b112de7f5954e8c7d8cc0a9371be",
"assets/images/partially_sunny.png": "933bba089226de09852fc771a4944e04",
"assets/images/ASIDE.gif": "ace30db8797a876fa29f3cdf5deac29c",
"assets/images/sct_logo.jpeg": "057c783fe9caf58410247563e7ef82c0",
"assets/images/tarantarancow.jpeg": "641d237ae8c286c08baeb31b0dc21591",
"assets/images/mission.jpeg": "dd3abcff7d1bc1f2b9e85527c0382239",
"assets/images/awadh_logo.jpeg": "b7f6b0ac4dbc70106a236c57cccd04c5",
"assets/images/logo1.jpeg": "dbf3b369aae67ee9d76dd8e77dcbcf72",
"assets/images/background.jpeg": "bd6c32e97b2cbcd553ec611b45df8b05",
"assets/images/tarantarancow1.jpeg": "66d5cf06f4a8d8c41ddd674995209e4e",
"assets/images/wall2.jpeg": "df52e691381c5fa9c73e558eb04a248b",
"assets/images/awadh_logo_only.jpeg": "e0398ebc6696db87de1cd3cf06e278dc",
"assets/images/mooofarmlogo.png": "7ac4a67caf59d13ad901313d78d86e7d",
"assets/images/weather.png": "efde235bf2fb575cd8fa8fbc3e364c02",
"assets/images/awadh_fam.jpeg": "01837cbf9851dd808c98e223897de70f",
"assets/images/moon.png": "287210aa9707238a0eb05f20c6bf798c",
"assets/images/science_tech_logo.png": "296486d162cc230c3c84832635fc11b0",
"assets/images/cow_banner1.jpeg": "57803bd7699b9c2fa5570ca5c0c47ac5",
"assets/images/mooofarm_banner.jpeg": "8d328885cfd6bc694152e5d71473c727",
"assets/images/logo2.jpeg": "dc596b4f8728af0929d7708b0d720e56",
"assets/images/gateway_img.png": "a386ecc8e2800cd30a514777fb88d97d",
"assets/images/sunny.png": "058eeb479d826e718512b2b51bd15737",
"assets/images/img1.jpeg": "4f23bc60249afa8b3076f2d15c6d279c",
"assets/images/cloud.png": "cc30f032ccb235d8dbd8bbaf9e872e2c",
"assets/images/imgr1.png": "c180461063bf1ee165c15cdde7dd22ca",
"assets/images/awadh_logo2.jpeg": "8c36cb4a40dc386dd0fd91291e22edc7",
"assets/images/awadhlogo.png": "6d6b64421d1b4a04c1d5c30a14e66161",
"assets/images/iitropar_logo.png": "5a6eb829762e36a3f3daddc2e0255ad6",
"assets/images/gps.jpeg": "b7defc003367d18be72b85143161f72d",
"assets/images/mist.png": "2b13d77fbadc07dd4613e578b04c71f5",
"assets/images/weather1.jpeg": "fe21802e177e05a1515991ad2455b117",
"assets/images/awadh_banner.jpeg": "3f415f6af78bac905ae82a84f13b600d",
"assets/images/sunset.png": "897a651ef098d6bc365ab49221fc457f",
"assets/AssetManifest.json": "e56d85bf34589af8573daea12708f674",
"assets/NOTICES": "5fdd2ca107b0e7716f160dda49b70a69",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "1ffa2fb77d8050b4a5415fb534de6eeb",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.bin": "4be85a4474ba609abc7f59c7a71e5f0a",
"assets/fonts/MaterialIcons-Regular.otf": "32fce58e2acb9c420eab0fe7b828b761",
"assets/assets/images/login.png": "b56ef485cbc7f4f4f5269dd2abff6124",
"assets/assets/images/wall1.webp": "f022b112de7f5954e8c7d8cc0a9371be",
"assets/assets/images/partially_sunny.png": "933bba089226de09852fc771a4944e04",
"assets/assets/images/ASIDE.gif": "ace30db8797a876fa29f3cdf5deac29c",
"assets/assets/images/sct_logo.jpeg": "057c783fe9caf58410247563e7ef82c0",
"assets/assets/images/tarantarancow.jpeg": "641d237ae8c286c08baeb31b0dc21591",
"assets/assets/images/mission.jpeg": "dd3abcff7d1bc1f2b9e85527c0382239",
"assets/assets/images/awadh_logo.jpeg": "b7f6b0ac4dbc70106a236c57cccd04c5",
"assets/assets/images/logo1.jpeg": "dbf3b369aae67ee9d76dd8e77dcbcf72",
"assets/assets/images/background.jpeg": "bd6c32e97b2cbcd553ec611b45df8b05",
"assets/assets/images/tarantarancow1.jpeg": "66d5cf06f4a8d8c41ddd674995209e4e",
"assets/assets/images/wall2.jpeg": "df52e691381c5fa9c73e558eb04a248b",
"assets/assets/images/awadh_logo_only.jpeg": "e0398ebc6696db87de1cd3cf06e278dc",
"assets/assets/images/mooofarmlogo.png": "7ac4a67caf59d13ad901313d78d86e7d",
"assets/assets/images/weather.png": "efde235bf2fb575cd8fa8fbc3e364c02",
"assets/assets/images/awadh_fam.jpeg": "01837cbf9851dd808c98e223897de70f",
"assets/assets/images/moon.png": "287210aa9707238a0eb05f20c6bf798c",
"assets/assets/images/science_tech_logo.png": "296486d162cc230c3c84832635fc11b0",
"assets/assets/images/cow_banner1.jpeg": "57803bd7699b9c2fa5570ca5c0c47ac5",
"assets/assets/images/mooofarm_banner.jpeg": "8d328885cfd6bc694152e5d71473c727",
"assets/assets/images/logo2.jpeg": "dc596b4f8728af0929d7708b0d720e56",
"assets/assets/images/gateway_img.png": "a386ecc8e2800cd30a514777fb88d97d",
"assets/assets/images/sunny.png": "058eeb479d826e718512b2b51bd15737",
"assets/assets/images/img1.jpeg": "4f23bc60249afa8b3076f2d15c6d279c",
"assets/assets/images/cloud.png": "cc30f032ccb235d8dbd8bbaf9e872e2c",
"assets/assets/images/imgr1.png": "c180461063bf1ee165c15cdde7dd22ca",
"assets/assets/images/awadh_logo2.jpeg": "8c36cb4a40dc386dd0fd91291e22edc7",
"assets/assets/images/awadhlogo.png": "6d6b64421d1b4a04c1d5c30a14e66161",
"assets/assets/images/iitropar_logo.png": "5a6eb829762e36a3f3daddc2e0255ad6",
"assets/assets/images/gps.jpeg": "b7defc003367d18be72b85143161f72d",
"assets/assets/images/mist.png": "2b13d77fbadc07dd4613e578b04c71f5",
"assets/assets/images/weather1.jpeg": "fe21802e177e05a1515991ad2455b117",
"assets/assets/images/awadh_banner.jpeg": "3f415f6af78bac905ae82a84f13b600d",
"assets/assets/images/sunset.png": "897a651ef098d6bc365ab49221fc457f",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
