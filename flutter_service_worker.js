'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "80b8084792063c2ae8c4220a3dd782dc",
"index.html": "e2debfdd305a99167a5f1c45a41d0d2b",
"/": "e2debfdd305a99167a5f1c45a41d0d2b",
"main.dart.js": "c3d0f60196b990c4050c0c7ee2e2c30b",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "7ac4a67caf59d13ad901313d78d86e7d",
"icons/Icon-192.png": "7ac4a67caf59d13ad901313d78d86e7d",
"icons/Icon-maskable-192.png": "7ac4a67caf59d13ad901313d78d86e7d",
"icons/Icon-maskable-512.png": "7ac4a67caf59d13ad901313d78d86e7d",
"icons/Icon-512.png": "7ac4a67caf59d13ad901313d78d86e7d",
"manifest.json": "9ff5af7aeb30da31f06fd643ca324344",
"assets/AssetManifest.json": "34479b871ec9dd84be515ed5a1c0511c",
"assets/NOTICES": "a8786705a9a97a2802e64eda4f180d83",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/packages/easy_localization/i18n/ar-DZ.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/packages/easy_localization/i18n/en.json": "5f5fda8715e8bf5116f77f469c5cf493",
"assets/packages/easy_localization/i18n/en-US.json": "5f5fda8715e8bf5116f77f469c5cf493",
"assets/packages/easy_localization/i18n/ar.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "afd2042570739eb13527c855dfd5afec",
"assets/fonts/MaterialIcons-Regular.otf": "641db90cd3bdb2de21d370e6417f1888",
"assets/assets/images/login.png": "b56ef485cbc7f4f4f5269dd2abff6124",
"assets/assets/images/ASIDE.gif": "ace30db8797a876fa29f3cdf5deac29c",
"assets/assets/images/sct_logo.jpeg": "057c783fe9caf58410247563e7ef82c0",
"assets/assets/images/tarantarancow.jpeg": "641d237ae8c286c08baeb31b0dc21591",
"assets/assets/images/mission.jpeg": "dd3abcff7d1bc1f2b9e85527c0382239",
"assets/assets/images/awadh_logo.jpeg": "b7f6b0ac4dbc70106a236c57cccd04c5",
"assets/assets/images/logo1.jpeg": "dbf3b369aae67ee9d76dd8e77dcbcf72",
"assets/assets/images/background.jpeg": "bd6c32e97b2cbcd553ec611b45df8b05",
"assets/assets/images/tarantarancow1.jpeg": "66d5cf06f4a8d8c41ddd674995209e4e",
"assets/assets/images/awadh_logo_only.jpeg": "e0398ebc6696db87de1cd3cf06e278dc",
"assets/assets/images/mooofarmlogo.png": "7ac4a67caf59d13ad901313d78d86e7d",
"assets/assets/images/awadh_fam.jpeg": "01837cbf9851dd808c98e223897de70f",
"assets/assets/images/Screenshot%25202023-07-17%2520at%25203.58.22%2520PM.png": "3e1f0f88b6a33e9cc7828ebd868c5ef5",
"assets/assets/images/science_tech_logo.png": "296486d162cc230c3c84832635fc11b0",
"assets/assets/images/cow_banner1.jpeg": "57803bd7699b9c2fa5570ca5c0c47ac5",
"assets/assets/images/mooofarm_banner.jpeg": "8d328885cfd6bc694152e5d71473c727",
"assets/assets/images/logo2.jpeg": "dc596b4f8728af0929d7708b0d720e56",
"assets/assets/images/gateway_img.png": "a386ecc8e2800cd30a514777fb88d97d",
"assets/assets/images/img1.jpeg": "4f23bc60249afa8b3076f2d15c6d279c",
"assets/assets/images/imgr1.png": "c180461063bf1ee165c15cdde7dd22ca",
"assets/assets/images/awadh_logo2.jpeg": "8c36cb4a40dc386dd0fd91291e22edc7",
"assets/assets/images/awadhlogo.png": "6d6b64421d1b4a04c1d5c30a14e66161",
"assets/assets/images/iitropar_logo.png": "5a6eb829762e36a3f3daddc2e0255ad6",
"assets/assets/images/gps.jpeg": "b7defc003367d18be72b85143161f72d",
"assets/assets/images/awadh_banner.jpeg": "3f415f6af78bac905ae82a84f13b600d",
"assets/assets/images/acc.jpeg": "144da27563a63674609da0f17a7b2284",
"assets/assets/en.json": "67e247dec19cfd4804b98396744e6374",
"assets/assets/pa.json": "6259ade84704ffebba99ddb5fc116c6f",
"assets/assets/hi.json": "24d1563c79880736854f584e631c226a",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
".idea/intellij-javadocs-4.0.1.xml": "8d9cf0fa47db221426497f4e33aac00b",
".idea/google-java-format.xml": "0c47b75792526cd421692a7de29f48ea",
".idea/vcs.xml": "4b9786b6d311d52068f211393c8ed770",
".idea/workspace.xml": "60bcd72a847e68ddda37feea8f354963",
".idea/modules.xml": "1eb3b065c55895e347308e50cd717dee",
".idea/web.iml": "52db5efd0fe9f576a1302b8c4b5eac6c",
".idea/misc.xml": "2e20827db6e9f7e4ede2c2b04135e476",
".idea/kotlinScripting.xml": "1124fa3a8b25f0f60036884896764430"};
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
