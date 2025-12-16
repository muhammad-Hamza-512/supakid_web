'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "a931364aa89278e97ec31163e10b6b76",
"assets/AssetManifest.bin.json": "b526862b0b8b66c509acfbed6aa6d7ee",
"assets/AssetManifest.json": "8a5bc3a85623065d86cace67ec4fff67",
"assets/assets/icons/active.png": "a625569cec7e2c197a1d6ecb358cdcab",
"assets/assets/icons/age.png": "26d1351377e2d762b877b5a8381a2196",
"assets/assets/icons/approve.png": "73a16a5bb239c6dfe33d9284b99b7905",
"assets/assets/icons/approved.png": "bf0c8e0677000126f617b961756b167a",
"assets/assets/icons/backIcon.png": "68eaf17536e6329df5d9dd27898f00f0",
"assets/assets/icons/bell.png": "5312f59930f1fc061a007d95a44bcb13",
"assets/assets/icons/bill.png": "83b9f0459acc86d227a05dc39052d51b",
"assets/assets/icons/billing.png": "fd01d8c0f63bbccf409d84fa4ef1ca25",
"assets/assets/icons/cancel.png": "b75d04f70a3caf80e78c697e80f3ef81",
"assets/assets/icons/category.png": "d909299fa8d1488ad4a6c36863f05640",
"assets/assets/icons/child.png": "9706f251def15bf19147300baf4847b6",
"assets/assets/icons/childs.png": "79c133ad2219f26389d35e1c6e93ef44",
"assets/assets/icons/chnagePlane.png": "681c801c2bad29a22fd0e6621e4bb3d8",
"assets/assets/icons/content.png": "79cc6c4542faa0a541216e7e13e49d08",
"assets/assets/icons/csv.png": "ece7dc2c7724d1034a5ac3e3f8f31c7c",
"assets/assets/icons/delete.png": "908fe7c1fb41bb49d5bcf4e25e00d72d",
"assets/assets/icons/downgrade.png": "f1605e13d028288fa87b1b7de4bd22bf",
"assets/assets/icons/download.png": "3d17f60b568060a5ebeb28e65b1f2b25",
"assets/assets/icons/edit.png": "c905cd01166cc3a2e3c30bc28477f0fe",
"assets/assets/icons/email.png": "b60b163a40470b774773a774c88be207",
"assets/assets/icons/favourite.png": "94baf4f67a25bdc3eed914f6334ca75f",
"assets/assets/icons/favs.png": "7a5a800f215b871cea7f30ab21a9b7b2",
"assets/assets/icons/game.png": "0930a43201107c80eeb8d8b8f12d4340",
"assets/assets/icons/history.png": "ca8aa96b87714380cb1166333ce0256f",
"assets/assets/icons/home.png": "2dd94fa301fbf6eed11696d652094480",
"assets/assets/icons/languageIcon.png": "078d40da087750b0ffd8bb4a8be71731",
"assets/assets/icons/lock.png": "a565b15f9ccb5ae81577beb828ca6442",
"assets/assets/icons/logout.png": "6d14e0de85d316cf96fc8b5c9b3e4f78",
"assets/assets/icons/mobile.png": "8d8d0c3f97f245a463ae55356983d174",
"assets/assets/icons/mobs.png": "0046389a4a66972bfbb2f1ea9802a199",
"assets/assets/icons/money.png": "4e7eacaec59839e1e9f67443a520cbbf",
"assets/assets/icons/myDownloads.png": "b9c26880fac0fcb792cb65dac514967e",
"assets/assets/icons/myProfile.png": "c8fd82a91ca12c500fcb78d8744ecb26",
"assets/assets/icons/netflix.png": "91861b749841221d52122f0c2933d8a6",
"assets/assets/icons/netflix1.png": "bb7694e39ab63dcba6fbe92742e6a24b",
"assets/assets/icons/netflix2.png": "60d62af90c8d50544f49be03d2854e08",
"assets/assets/icons/netflix3.png": "cdd883797f20471115a542a6701245b2",
"assets/assets/icons/netflix4.png": "a4f97db2bc434ea7f392faddd20dc731",
"assets/assets/icons/netflix5.png": "21cc0bfa110cb6a13e99b16790744654",
"assets/assets/icons/netflix6.png": "e20b266ee8344d40b55500db33cf5af6",
"assets/assets/icons/payment.png": "fe9f661445542ab8b9b161b8b823cf7e",
"assets/assets/icons/person.png": "f4eab069600bf242d5d0f1932722efa8",
"assets/assets/icons/phone.png": "953197fb2c4466ce2595ed47bf82312b",
"assets/assets/icons/plans.png": "5fb1e44ead26cb22bc48542cf224a18b",
"assets/assets/icons/plus.png": "6bab0a712d295815017cb775aec050ab",
"assets/assets/icons/prefer.png": "9b89bd2656f40084aaf332e60929dd95",
"assets/assets/icons/premium.png": "efc0dcf052cb58f58f818f02b98d8541",
"assets/assets/icons/profile.png": "ebb47bc27eba5eaab40c80398999fdd7",
"assets/assets/icons/reports.png": "d03c316581349a1594d0971263566ffe",
"assets/assets/icons/right.png": "d2b5f8b2ea3f0b557085c921e70016b8",
"assets/assets/icons/setting.png": "8bd0b16522695e40ee3759c6ce222835",
"assets/assets/icons/status.png": "2fcb569c14c1ea42d841fc4aa600b41f",
"assets/assets/icons/stopwatch.png": "3ba08cea92f9773f17a53e989cc9750a",
"assets/assets/icons/upgrade.png": "4e3f0cd008dfb6a509194adf9adc844c",
"assets/assets/icons/users.png": "dc6dbb14db3ec1ab74982061f4997497",
"assets/assets/icons/vedioPlayer.png": "7512ac4fc437bcfce40560d1b4a6c858",
"assets/assets/icons/views.png": "07a97ff53cec91ee447e5d20a20678b2",
"assets/assets/icons/youtube.png": "bb0f03c85ecd08568ddd3f59085fb04a",
"assets/assets/images/art.png": "2bd2266255e4319f45dac2f6b7464e4d",
"assets/assets/images/bg.png": "a16455ece6f31ab64ddd08efbfd18def",
"assets/assets/images/category1.png": "741f5b22c50e600d37209fde7f89090d",
"assets/assets/images/category3.png": "3a51e3bf3715accc1199438557eeec50",
"assets/assets/images/child.png": "08bdae58787409922d21ba101b1f7572",
"assets/assets/images/childs.png": "657f6679d500cf197f51affe634b5bdb",
"assets/assets/images/cuate.png": "2a87300f24e18eb1ebeb97cca6f4abe1",
"assets/assets/images/fav1.png": "341c980b636df668f445a78e47971f4a",
"assets/assets/images/fav2.png": "82afe0b0290003ff4f08b1b51cf07ea9",
"assets/assets/images/fav3.png": "f9a3c54a4078aec87210ba4068332cbb",
"assets/assets/images/funFact.png": "fa18b22f7efcf9ade03384776b783dd7",
"assets/assets/images/game1.png": "3c40fe02bec0f409f0373c72b37beefb",
"assets/assets/images/game2.png": "a50830430627462f14721e9ebafd8c22",
"assets/assets/images/game3.png": "e79925d8d02829a3a13d24bf597091bc",
"assets/assets/images/game4.png": "b901d5bd10f7c0765e68b4ec49176ea3",
"assets/assets/images/game5.png": "23dba5b234b19ebffaa8d3b538c37db3",
"assets/assets/images/game6.png": "66894fa48b371471a365c0d050428952",
"assets/assets/images/Graph.png": "baff16cf4676ebd859a13dce230970c6",
"assets/assets/images/graph1.png": "ea950785aabe1c8aa1d0035f118be0d4",
"assets/assets/images/graph2.png": "4a5d16ece200c4a956a461e6d9568049",
"assets/assets/images/graph3.png": "c6011b6a74d99934e0b7e8b1304e51d0",
"assets/assets/images/graph4.png": "b5d28531e6ee0985b3814f50263f3272",
"assets/assets/images/islamic.png": "5a05d38c7ddc9cc38bc5585796f2a1bd",
"assets/assets/images/learning.png": "5a48ebb91acc34d3d191760219788e5b",
"assets/assets/images/lion.png": "e234465fb496d8bc56b8d28e439b564f",
"assets/assets/images/nextWatch1.png": "0e6078225587585847ee74879c64100f",
"assets/assets/images/nextWatch2.png": "839c40c26d103ed4ca5bbd57dbbd1812",
"assets/assets/images/nextWatch3.png": "37a8ec22528c7ce921f4244dab8d6244",
"assets/assets/images/onBoard1.png": "96b87d33162e70194933e20deeb1f552",
"assets/assets/images/onBoard2.png": "8072c3ddb4f831682db8042b52713304",
"assets/assets/images/onBoard3.png": "c722582a489876deec9e9477ccdb3366",
"assets/assets/images/parent.png": "347d2403b4ff810d9bc5ef376ea4fac3",
"assets/assets/images/pencil.png": "aad5e681f45c296ae83c00268d40f564",
"assets/assets/images/profile1.png": "50d83c9518aa5f8a2c8f2c553cdf4703",
"assets/assets/images/profile2.png": "43a8049a7b9fe55402da688e0749310f",
"assets/assets/images/profile3.png": "5e4e5796d2141b39599ef6d067dc6c3e",
"assets/assets/images/profile4.png": "f0de596530601f00459b009bad2e30f5",
"assets/assets/images/space.png": "3aa41f81896734b88d24ba03c52cfcfe",
"assets/assets/images/spLogo.png": "bd18b43c09d28ede3d1a12666e0c097b",
"assets/assets/images/success.png": "35e373de26b0c896d9fd0d53fb5ec1ea",
"assets/assets/images/supaLogo.png": "ff7416c29d0f21c0ddec906aca96fe85",
"assets/assets/images/thumbnail.png": "7b28f5bc1d71b2518d329529ba36d4f3",
"assets/assets/images/title.png": "fdcc1738d5267e240f67615d66aea779",
"assets/assets/images/titles.png": "e49473ef8752e8bc9d7215a288e96ef0",
"assets/assets/images/videoPlay.png": "bc6eab327e30bdabc6a26c21f64e94e7",
"assets/assets/images/watching1.png": "1c1c81a8b308a18583ed6c2ee2e0ce36",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "4704f3644ea349b16514b2d052d0078c",
"assets/NOTICES": "70f779a00189ed122beec20c1d0952f0",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "e8ec78d34caab90e796f1f0492ca8f64",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "3c613c95f1822030e78012b6ce25a999",
"/": "3c613c95f1822030e78012b6ce25a999",
"main.dart.js": "cdffa533fbbc99f9c05d0e6943f08ba8",
"manifest.json": "68028b1185c42355f954ab2b428bb800",
"version.json": "f9f4b9e0a73b98498fd1a90de2369331"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
