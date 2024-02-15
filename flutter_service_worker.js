'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "81d0ab4113c4da2168a44a9fbe7e9f31",
"assets/AssetManifest.bin.json": "4117c2b7e9bc4af0e6332fc2268274df",
"assets/AssetManifest.json": "60d7198cd19a7d7eef1b6e86b7b0bed9",
"assets/assets/images/ASIDE.gif": "ace30db8797a876fa29f3cdf5deac29c",
"assets/assets/images/awadhlogo.png": "6d6b64421d1b4a04c1d5c30a14e66161",
"assets/assets/images/awadh_banner.jpeg": "3f415f6af78bac905ae82a84f13b600d",
"assets/assets/images/awadh_fam.jpeg": "01837cbf9851dd808c98e223897de70f",
"assets/assets/images/awadh_logo.jpeg": "b7f6b0ac4dbc70106a236c57cccd04c5",
"assets/assets/images/awadh_logo2.jpeg": "8c36cb4a40dc386dd0fd91291e22edc7",
"assets/assets/images/awadh_logo_only.jpeg": "e0398ebc6696db87de1cd3cf06e278dc",
"assets/assets/images/background.jpeg": "bd6c32e97b2cbcd553ec611b45df8b05",
"assets/assets/images/background.png": "431abaf09141de9d275fced419865e5b",
"assets/assets/images/cloud.png": "cc30f032ccb235d8dbd8bbaf9e872e2c",
"assets/assets/images/contact.jpg": "0edce5eee13cbb266e82a6b0e9fb63e9",
"assets/assets/images/contact_background.jpg": "3721750cbc376a9e696f0707bafd08a8",
"assets/assets/images/cow_banner1.jpeg": "57803bd7699b9c2fa5570ca5c0c47ac5",
"assets/assets/images/deshraj_sir.png": "1d713a72fc2dc881c000490b81b9197c",
"assets/assets/images/farmer_background.jpg": "9b324993069911d7d4dcefa375da56eb",
"assets/assets/images/farmer_input.jpg": "06390c79634e5e54397660e6022e2d4f",
"assets/assets/images/farmer_input_background.jpg": "3114817bfb7db713e0cf38f382898976",
"assets/assets/images/farmer_query_bg.jpg": "13c024a39806bf7d3ba1667ebf4bd251",
"assets/assets/images/gateway_img.png": "a386ecc8e2800cd30a514777fb88d97d",
"assets/assets/images/gps.jpeg": "b7defc003367d18be72b85143161f72d",
"assets/assets/images/iitropar_logo.png": "5a6eb829762e36a3f3daddc2e0255ad6",
"assets/assets/images/img1.jpeg": "4f23bc60249afa8b3076f2d15c6d279c",
"assets/assets/images/imgr1.png": "c180461063bf1ee165c15cdde7dd22ca",
"assets/assets/images/login.png": "b56ef485cbc7f4f4f5269dd2abff6124",
"assets/assets/images/login_bg.jpg": "5cbdc3443f0a2aadb0970a05bf5661dd",
"assets/assets/images/logo1.jpeg": "dbf3b369aae67ee9d76dd8e77dcbcf72",
"assets/assets/images/logo2.jpeg": "dc596b4f8728af0929d7708b0d720e56",
"assets/assets/images/mission.jpeg": "dd3abcff7d1bc1f2b9e85527c0382239",
"assets/assets/images/mist.png": "2b13d77fbadc07dd4613e578b04c71f5",
"assets/assets/images/moon.png": "287210aa9707238a0eb05f20c6bf798c",
"assets/assets/images/mooofarmlogo.png": "7ac4a67caf59d13ad901313d78d86e7d",
"assets/assets/images/mooofarm_banner.jpeg": "8d328885cfd6bc694152e5d71473c727",
"assets/assets/images/partially_sunny.png": "933bba089226de09852fc771a4944e04",
"assets/assets/images/query.jpg": "c02d5a47dfdc41dad54b93ab244a8f24",
"assets/assets/images/science_tech_logo.png": "296486d162cc230c3c84832635fc11b0",
"assets/assets/images/sct_logo.jpeg": "057c783fe9caf58410247563e7ef82c0",
"assets/assets/images/sunny.png": "058eeb479d826e718512b2b51bd15737",
"assets/assets/images/sunset.png": "897a651ef098d6bc365ab49221fc457f",
"assets/assets/images/tarantarancow.jpeg": "641d237ae8c286c08baeb31b0dc21591",
"assets/assets/images/tarantarancow1.jpeg": "66d5cf06f4a8d8c41ddd674995209e4e",
"assets/assets/images/wall1.webp": "f022b112de7f5954e8c7d8cc0a9371be",
"assets/assets/images/wall2.jpeg": "df52e691381c5fa9c73e558eb04a248b",
"assets/assets/images/weather.png": "efde235bf2fb575cd8fa8fbc3e364c02",
"assets/assets/images/weather1.jpeg": "fe21802e177e05a1515991ad2455b117",
"assets/assets/images/weather_bg.jpg": "2b0d80f8f31276de0f4c77b34e77ecf5",
"assets/assets/images/weather_data.jpg": "b5ffc294db755d8c978ef6400c2fb4b8",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/NOTICES": "147c9b06e3b4d9dd03b79d68bda0370c",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "9299e21d4e19fca65f4715ca2bae6641",
"flutter.js": "59a12ab9d00ae8f8096fffc417b6e84f",
"icons/Icon-192.png": "9299e21d4e19fca65f4715ca2bae6641",
"icons/Icon-512.png": "9299e21d4e19fca65f4715ca2bae6641",
"icons/Icon-maskable-192.png": "9299e21d4e19fca65f4715ca2bae6641",
"icons/Icon-maskable-512.png": "9299e21d4e19fca65f4715ca2bae6641",
"index.html": "c6a1d63771e0b552b3c0d56329aa3021",
"/": "c6a1d63771e0b552b3c0d56329aa3021",
"main.dart.js": "b342c18892943c20d8c9dd2dc4370000",
"manifest.json": "9103a8a0e9aaa23ae53f1be3eabc1f3b",
"version.json": "23e9d24d5b36279cbfede1d4ebb467c0"};
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
