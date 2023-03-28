'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"main.dart.js": "cc6f937b78af9a8f724992d21894ab5c",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"favicon.png": "9de677918f3fda3df3948fc463693f03",
"version.json": "efbcc7f7042193658acb4fb87fb68eb4",
"manifest.json": "e617e3f98563b7f665de4f76e62559dc",
"assets/AssetManifest.json": "40dde5b5de79fac25ea38ec3eb0a0bf5",
"assets/assets/images/home-appbar-logo.png": "1a836d9bfd901979364586834ecca3c5",
"assets/assets/images/clock.png": "ab75328897650c6ddd55c8900d634fef",
"assets/assets/images/reporting1.png": "085a1d9cc65695d4b459a0acfcf2ab24",
"assets/assets/images/books.png": "12227f502619ea9d4c6aee212b16e0b9",
"assets/assets/images/launcher.png": "032bc0de65e1aa143991cc56990a86fb",
"assets/assets/images/foreground.png": "37607d5829b24dc16ba30f1958a5ae6a",
"assets/assets/images/gura.jpg": "61f252917aa2fe487dc9dbba5e75d054",
"assets/assets/images/register-apple.png": "f952b612097092929aabdf60480613fc",
"assets/assets/images/photo-placeholder.png": "29b9769899cb24b8a257d75ef0ed032c",
"assets/assets/images/register-google.png": "5bd5ec3e4da4b55b5debe1b3fa95b488",
"assets/assets/images/kobo.jpg": "396b4aeea5621d7fd2f1b403c0b8d0f7",
"assets/assets/images/information.png": "148fd275d3a5993155cd4191b294e2f3",
"assets/assets/images/building.png": "a967259d2712c0bb628565e004215d48",
"assets/assets/images/container.png": "96de7966d483da0c163f25e6aa83d0b9",
"assets/assets/images/user.png": "d963f843922ec57a3b3ff273f2e7055c",
"assets/assets/images/usada-pekora.png": "b0334f04ff7de7d891b1c1e872607d4a",
"assets/assets/images/lock.png": "af60449c9fd9786af048cae8629df41b",
"assets/assets/images/logo-login.png": "a072db79f3805d0fd03fc2f5d205dd36",
"assets/assets/images/moona.jpg": "86c6c8582d7dd3d88a3b4cb10fd5b0c7",
"assets/assets/images/illust-login.png": "ed8854014b5ac528ae02bf57fc147789",
"assets/assets/images/reporting2.png": "391df6de2eda3fedb953fcae28019f73",
"assets/assets/images/heart_bigger.png": "0e29a91e44f0a30fae1ff5d908fb6c54",
"assets/assets/images/appbarback.png": "835762da1c517592c8c158a44b4c5225",
"assets/assets/images/lock_black.png": "391df6de2eda3fedb953fcae28019f73",
"assets/assets/images/profile.jpg": "b91c52bbb8867a3b9c359e2551a170af",
"assets/assets/images/volume_ok.png": "8f153ec58b824e48668ead30ccc35fd1",
"assets/assets/images/pikamee.jpg": "886d025f2c3ee19a1cf1831a739ae24e",
"assets/assets/images/register-facebook.png": "e3e648a9dedffcae9c79e975eebdf348",
"assets/assets/images/info.png": "1d5b92796558a3a1acfb6b5ee6cafa2b",
"assets/assets/images/exercise_remedial.png": "5a760c8737c137a7bc9bc8681b532315",
"assets/assets/images/tree.png": "8314da4a29d2be56bb65355a1c84945d",
"assets/assets/images/progress_bar.png": "3552ea2e41c6a8d0efb2063e7c5cf678",
"assets/assets/images/door.png": "308028066b402d306d1055264b22371d",
"assets/assets/images/crown.png": "6c22dac744ef4993ba9f6a3553366000",
"assets/assets/images/heart.png": "38a4fd60a0f2babca976942584c4cb68",
"assets/assets/images/miko.jpg": "9519b279e92443862d640bbba9abb4df",
"assets/assets/images/book-stack1.png": "695f3fe17f32672364aeb7e99bbd645d",
"assets/assets/images/podcast-2.png": "db0f4aa235982631f08304f435de5059",
"assets/assets/images/more_students.png": "fc0c6bf56b8b7bfff2c1d6ad97073692",
"assets/assets/images/check.png": "d2b55cd36f8111a91e91ed9e2272f621",
"assets/assets/images/pekora.jpg": "156895b4212b27a8b098b8ed3c9e06fe",
"assets/assets/images/crown_bigger.png": "780332cb02b36e955cd5c443dd574c4c",
"assets/assets/images/car.png": "448c63d0f7dd3d21cac370e96bdc2280",
"assets/assets/images/photo-picker.png": "49e00812a242cc7500f85de5c4dff002",
"assets/assets/images/microphone.png": "45dc4119455bf9297f8d67e343e5df4d",
"assets/assets/images/volume_reading.png": "491730ab4f7289dd583aa69962a1a400",
"assets/assets/images/container_reading.png": "0a51f09e8adb1c60bb39608ac5ec5f6b",
"assets/assets/images/back-button.png": "39fa1bf0c5807b3df341b4666500aa5d",
"assets/assets/images/icon-foreground.png": "d77e67d79691930e8e1612cf14509469",
"assets/assets/images/exercise.png": "f6e73993e31431584ff046819996d1ba",
"assets/assets/images/chicken.png": "8253ac46a32bdcccf9ad4ba96bf24c13",
"assets/assets/images/play_store_512.png": "8ee3b192982f946282510c7eaf5a9af1",
"assets/assets/images/reading.png": "01d92904e075f06d2b117ecb8ce6704c",
"assets/assets/images/remedial_warning.png": "9062e47fd2192a43988118b16c440da5",
"assets/assets/audio/nihao.mp3": "51248b32c616dca40981ba74bebe4f8c",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "9cda082bd7cc5642096b56fa8db15b45",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "0a94bab8e306520dc6ae14c2573972ad",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "b00363533ebe0bfdb95f3694d7647f6d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/flutter_sound_web/src/flutter_sound.js": "aecd83c80bf4faace0bcea4cd47ab307",
"assets/packages/flutter_sound_web/src/flutter_sound_player.js": "6bf84579813fd481ec5e24e73927500d",
"assets/packages/flutter_sound_web/src/flutter_sound_recorder.js": "f7ac74c4e0fd5cd472d86c3fe93883fc",
"assets/packages/flutter_sound_web/howler/howler.js": "2bba823e6b4d71ea019d81d384672823",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/NOTICES": "84c0b31691d63ccfe1d415b223159bef",
"index.html": "66430b10f61e9565db532170e123e881",
"/": "66430b10f61e9565db532170e123e881",
"icons/Icon-512.png": "003194ab013a304ae52f37f2f92a4197",
"icons/Icon-192.png": "2e0e62fc6491ca3c3a1c5cd142f1ccfa",
"icons/Icon-maskable-512.png": "003194ab013a304ae52f37f2f92a4197",
"icons/Icon-maskable-192.png": "2e0e62fc6491ca3c3a1c5cd142f1ccfa"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
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
