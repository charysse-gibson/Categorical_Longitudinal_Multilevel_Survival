/*------------------Poisson Regression-----------------------*/
/*A sample of 557 biochemists who got their doctorates from */
/*106 American universities in the late 1950s and early 1960s*/
options nodate;
title 'Poisson regression for count data';
title1 'Scientific Productivity Example';
data postdoc;
input pdoc age mar doc und agri arts cits docid;
datalines;
0 29 1 362 7 0 1 2 1402
1 32 1 210 6 0 1 4 1250
1 26 1 359 6 0 0 1 1399
0 25 1 181 3 0 0 1 1221
1 30 1 429 7 0 0 1 1469
1 28 1 359 6 0 1 0 1399
1 30 1 210 4 0 0 0 1250
1 40 1 347 4 0 0 0 1387
0 30 1 210 5 0 1 2 1250
1 28 1 359 7 0 5 32 1399
0 29 1 447 4 0 0 0 1487
1 28 1 276 5 0 1 0 1316
0 41 1 261 3 0 0 0 1301
1 27 1 226 7 0 0 1 1266
1 35 1 359 6 0 0 1 1399
1 30 0 341 5 0 7 16 1381
0 28 0 226 1 0 1 1 1266
1 28 1 429 4 0 3 3 1469
0 27 0 359 3 0 0 0 1399
1 27 0 205 4 0 0 0 1245
1 27 0 276 5 0 0 0 1316
0 37 1 347 7 0 1 2 1387
1 26 1 210 7 0 1 4 1250
0 34 1 236 5 0 0 1 1276
0 35 0 359 5 0 0 1 1399
1 31 0 341 7 0 3 7 1381
1 27 0 214 6 0 0 0 1254
1 37 1 250 5 0 2 2 1290
1 26 1 261 7 0 2 7 1301
0 27 1 181 5 0 0 1 1221
1 27 1 226 4 0 0 0 1266
1 27 1 362 6 0 0 1 1402
1 30 1 347 4 0 1 2 1387
0 30 1 359 9 0 0 1 1399
0 25 0 181 3 0 1 5 1221
1 29 1 429 5 0 0 1 1469
0 25 1 210 5 0 0 1 1250
0 29 1 215 6 0 0 0 1255
0 41 1 226 4 0 0 1 1266
1 31 1 359 5 0 0 1 1399
1 29 1 341 7 0 0 0 1381
1 26 0 359 4 0 1 1 1399
0 34 1 362 4 0 3 0 1402
1 31 1 210 5 0 0 0 1250
0 29 1 226 6 0 1 0 1266
1 26 1 276 4 0 2 0 1316
0 32 1 261 4 0 0 1 1301
1 27 1 347 6 0 0 0 1387
0 36 1 276 5 0 0 0 1316
0 25 0 210 7 0 0 1 1250
1 29 1 462 7 0 1 22 1502
1 30 1 454 6 0 1 0 1494
1 33 1 252 6 0 0 0 1292
1 27 1 454 7 0 2 1 1494
0 26 1 254 6 0 0 0 1294
0 35 1 198 5 0 1 0 1238
1 32 1 454 4 0 0 1 1494
0 28 0 336 6 0 0 0 1376
1 27 0 340 8 0 0 0 1380
0 37 1 186 3 0 1 16 1226
1 28 1 462 8 0 0 1 1502
0 26 1 414 7 0 1 0 1454
1 25 1 414 7 0 1 7 1454
1 30 1 283 7 0 2 7 1323
0 26 1 255 5 0 1 0 1295
1 27 1 462 7 0 1 37 1502
0 34 1 200 3 0 0 1 1240
0 33 1 198 5 0 0 0 1238
1 28 1 0 2 0 1 1 1040
0 35 1 286 5 0 0 0 1326
1 28 1 354 6 0 2 27 1394
0 28 0 340 8 0 0 0 1380
1 27 1 462 4 0 0 0 1502
0 31 1 283 3 0 2 27 1323
0 27 1 254 4 0 0 1 1294
1 27 0 287 6 0 1 2 1327
0 36 0 186 4 0 1 0 1226
0 27 1 392 3 0 1 2 1432
0 36 1 369 7 0 1 20 1409
0 28 1 336 7 0 2 1 1376
0 31 1 286 4 0 3 8 1326
0 42 0 454 6 0 0 0 1494
1 27 1 462 7 0 0 1 1502
1 25 0 340 6 0 0 1 1380
0 38 0 283 6 0 1 5 1323
1 25 1 258 7 0 4 2 1298
0 26 1 425 7 0 2 5 1465
0 36 1 369 6 0 2 9 1409
0 33 1 340 4 0 0 1 1380
1 29 1 454 7 0 0 1 1494
1 26 0 287 6 0 2 1 1327
0 29 1 258 7 0 0 1 1298
0 25 0 425 7 0 1 4 1465
1 28 1 392 7 0 0 0 1432
1 27 1 336 4 0 1 5 1376
1 31 1 232 4 0 0 0 1272
0 25 1 454 5 0 0 0 1494
1 31 1 336 5 0 0 0 1376
1 29 1 392 4 0 0 1 1432
1 25 0 392 7 0 0 1 1432
0 25 0 336 7 0 1 10 1376
1 31 0 178 6 0 0 1 1218
1 31 1 354 6 0 1 0 1394
1 25 0 392 6 0 0 1 1432
0 29 1 232 5 0 1 2 1272
0 39 0 309 4 0 1 0 1349
1 24 1 258 3 0 0 1 1298
1 27 0 340 5 0 3 5 1380
1 29 1 287 5 0 2 2 1327
0 29 1 462 7 0 2 9 1502
0 32 1 186 4 0 2 16 1226
1 32 1 122 3 0 0 1 1162
1 27 1 251 5 0 3 5 1291
1 30 1 251 3 0 3 7 1291
0 36 1 369 7 0 1 5 1409
0 27 1 178 7 0 1 1 1218
1 41 1 462 5 0 2 25 1502
1 29 1 122 4 0 1 0 1162
1 28 0 369 5 0 3 10 1409
0 33 0 212 5 0 0 1 1252
0 33 1 252 4 0 2 1 1292
0 33 1 232 5 0 0 1 1272
0 31 1 340 5 0 0 1 1380
1 29 1 462 7 0 1 2 1502
1 26 1 354 7 0 1 2 1394
0 30 1 198 4 0 0 0 1238
0 29 1 340 5 0 0 1 1380
1 28 0 392 3 0 0 0 1432
1 32 1 454 6 0 2 14 1494
1 29 0 454 6 0 2 7 1494
1 28 1 198 4 0 0 0 1238
1 26 1 454 4 0 1 0 1494
1 25 0 354 6 0 3 6 1394
0 36 1 392 7 0 0 1 1432
1 27 1 462 7 0 1 1 1502
1 26 1 392 1 0 3 5 1432
1 35 1 232 4 0 0 0 1272
0 31 1 286 5 0 1 5 1326
1 27 1 195 6 0 1 5 1235
1 30 0 392 8 0 0 1 1432
0 30 0 287 7 0 1 3 1327
1 32 1 369 5 0 2 10 1409
1 33 1 369 7 0 0 0 1409
0 32 1 195 4 0 1 1 1235
1 25 0 336 7 0 3 5 1376
0 27 1 232 4 0 0 1 1272
1 28 1 369 6 0 2 2 1409
1 32 1 321 6 0 0 1 1361
1 26 1 336 7 0 0 1 1376
0 33 1 232 5 0 1 3 1272
0 31 1 212 3 0 0 0 1252
1 35 1 454 4 0 0 1 1494
1 34 1 232 5 0 0 1 1272
1 33 1 254 5 0 3 5 1294
0 33 1 286 5 0 0 0 1326
0 28 1 347 3 0 0 0 1387
1 26 1 462 3 0 0 1 1502
1 32 1 287 3 0 3 12 1327
1 31 1 232 3 0 0 0 1272
0 26 1 186 6 0 5 7 1226
1 27 1 195 5 0 1 0 1235
0 42 1 232 5 0 0 1 1272
0 33 1 425 5 0 1 5 1465
1 26 0 197 4 0 2 1 1237
0 25 1 186 8 0 15 74 1226
1 34 1 369 5 0 0 0 1409
1 30 1 454 5 0 0 0 1494
1 31 1 354 5 0 1 4 1394
1 28 1 454 8 0 0 0 1494
1 29 1 336 5 0 0 0 1376
0 31 1 256 4 0 1 20 1296
1 27 1 163 5 0 1 2 1203
1 34 1 163 4 0 1 0 1203
1 28 0 296 4 0 0 1 1336
1 31 1 454 6 0 1 2 1494
0 27 1 221 0 0 0 1 1261
0 31 0 0 5 0 2 15 1040
1 37 1 454 2 0 1 1 1494
0 33 1 221 6 0 0 1 1261
0 29 1 221 6 0 0 0 1261
0 33 0 454 6 0 0 1 1494
1 30 1 454 6 0 0 0 1494
0 28 1 221 6 0 3 12 1261
0 41 1 221 7 0 0 0 1261
0 30 1 454 6 0 2 3 1494
1 27 0 454 6 0 4 4 1494
1 30 1 176 3 0 1 0 1216
1 28 0 391 7 0 0 7 1431
1 37 1 348 7 0 0 1 1388
0 41 1 189 0 0 0 0 1229
1 29 1 373 6 0 0 1 1413
1 31 1 168 7 0 0 1 1208
1 32 1 296 4 0 2 10 1336
0 30 1 0 7 0 0 0 1040
0 26 1 213 5 0 0 1 1253
1 28 1 0 5 0 0 1 1040
1 28 1 286 5 0 0 1 1326
0 28 1 237 7 0 0 1 1277
0 33 1 449 4 0 1 0 1489
0 28 1 391 8 0 3 23 1431
0 27 1 237 4 0 1 1 1277
0 27 0 436 4 0 0 1 1476
1 30 1 183 4 0 0 3 1223
0 33 0 237 5 0 0 1 1277
1 39 1 183 7 0 2 11 1223
0 26 1 391 7 0 4 23 1431
1 35 1 0 7 0 0 0 1040
0 27 1 183 0 0 0 1 1223
0 29 1 237 5 0 0 1 1277
0 28 1 237 5 0 0 1 1277
1 30 1 335 4 0 0 1 1375
0 29 1 348 5 0 4 7 1388
0 28 1 366 6 0 0 2 1406
1 26 1 346 6 0 0 1 1386
1 26 1 349 7 0 0 1 1389
0 28 1 449 7 0 0 1 1489
1 32 1 130 4 0 0 4 1170
0 30 1 449 4 0 7 15 1489
1 29 1 173 4 0 0 2 1213
1 28 0 335 4 0 0 1 1375
0 26 1 183 5 0 0 0 1223
0 41 1 0 4 0 0 0 1040
1 29 1 449 7 0 1 3 1489
1 28 1 373 5 0 1 10 1413
1 27 1 166 9 0 0 1 1206
0 26 1 237 5 0 0 1 1277
0 31 1 206 7 0 0 1 1246
0 27 1 249 4 0 1 12 1289
1 26 1 449 7 0 0 1 1489
1 36 0 346 7 0 1 7 1386
0 29 1 180 3 0 0 0 1220
1 30 1 286 4 0 0 0 1326
0 33 1 348 8 0 3 20 1388
1 29 1 189 8 0 1 0 1229
1 32 1 286 5 0 0 1 1326
1 0 1 335 5 0 1 10 1375
1 25 1 373 7 0 0 1 1413
0 27 1 373 3 0 0 0 1413
0 26 0 373 7 0 0 1 1413
1 31 1 166 1 0 0 1 1206
1 30 1 166 3 0 0 0 1206
1 27 1 373 7 0 0 1 1413
1 27 1 206 6 0 0 0 1246
0 36 1 307 3 0 0 4 1347
0 31 1 391 4 0 0 0 1431
0 31 1 168 8 0 0 1 1208
0 27 1 286 8 0 0 1 1326
0 28 1 286 2 0 1 3 1326
1 27 0 436 2 0 0 1 1476
0 27 1 286 5 0 0 1 1326
1 26 1 335 4 0 1 0 1375
1 28 1 296 6 0 0 0 1336
0 32 1 215 5 0 0 0 1255
0 30 0 183 5 0 0 1 1223
0 0 1 176 5 0 0 4 1216
0 45 1 0 5 0 0 1 1040
1 31 1 0 5 0 1 11 1040
1 0 1 349 4 0 0 3 1389
0 28 1 237 5 0 0 1 1277
0 37 1 189 4 0 0 0 1229
1 30 1 189 5 0 0 0 1229
1 28 1 449 7 0 0 1 1489
0 23 1 214 6 0 0 0 1254
1 27 1 213 5 0 0 1 1253
1 26 1 335 7 0 0 3 1375
0 34 1 307 1 0 0 3 1347
0 33 1 449 7 0 2 8 1489
1 28 1 168 5 0 0 1 1208
0 33 1 286 1 0 1 1 1326
1 26 1 449 5 0 1 1 1489
0 27 1 286 5 0 0 1 1326
1 29 0 477 6 0 2 3 1517
0 30 1 260 3 0 1 1 1300
1 26 1 202 4 0 0 2 1242
0 32 1 196 7 0 1 1 1236
1 28 1 238 5 0 0 1 1278
1 33 1 477 5 0 0 0 1517
1 27 0 429 7 0 0 0 1469
1 28 1 260 4 0 0 1 1300
1 29 1 229 7 0 0 1 1269
1 26 1 322 5 0 2 11 1362
1 32 1 466 6 0 1 7 1506
0 37 1 196 6 0 2 7 1236
1 35 1 229 5 0 0 1 1269
0 33 1 256 5 0 0 1 1296
1 34 1 188 4 0 0 3 1228
0 27 0 429 6 0 0 0 1469
1 33 1 413 5 0 3 32 1453
1 31 1 477 7 0 2 1 1517
1 28 1 334 6 0 0 1 1374
1 27 0 477 7 0 0 3 1517
0 27 1 344 5 0 0 0 1384
1 29 0 334 7 0 2 0 1374
1 28 1 379 6 0 0 3 1419
1 26 1 250 3 0 0 0 1290
0 42 1 238 5 0 0 1 1278
0 31 1 238 5 0 0 0 1278
1 33 1 94 6 0 0 1 1134
1 29 1 466 5 0 0 1 1506
0 30 1 466 3 0 0 1 1506
1 37 0 250 2 0 0 0 1290
1 28 1 360 5 0 0 0 1400
1 31 1 313 4 0 0 1 1353
1 36 1 466 4 0 3 16 1506
1 28 1 254 7 0 0 1 1294
1 26 0 379 5 0 1 3 1419
1 27 1 256 9 0 0 0 1296
1 36 1 334 9 0 0 1 1374
0 29 1 173 5 0 11 33 1213
0 27 1 293 5 0 0 1 1333
1 26 1 477 7 0 0 0 1517
1 27 1 413 7 0 3 57 1453
1 30 1 293 7 0 3 8 1333
0 29 1 188 5 0 0 0 1228
1 32 1 317 4 0 1 3 1357
1 28 1 360 7 0 0 1 1400
0 31 1 466 7 0 0 1 1506
0 28 1 173 5 0 6 37 1213
1 32 1 380 7 0 0 1 1420
1 29 1 250 3 0 0 1 1290
1 26 1 229 6 0 0 1 1269
0 27 1 334 7 0 3 37 1374
0 30 1 196 6 0 0 0 1236
0 39 1 140 1 0 0 1 1180
1 33 1 229 5 0 0 1 1269
0 28 1 429 4 0 0 0 1469
1 26 0 293 5 0 6 20 1333
1 29 0 291 5 0 2 0 1331
1 27 1 322 5 0 2 11 1362
0 47 1 140 3 0 0 0 1180
0 45 1 477 7 0 6 3 1517
1 26 0 466 4 0 0 0 1506
1 27 0 466 8 0 3 11 1506
1 28 1 256 4 0 0 3 1296
1 32 1 274 4 0 0 1 1314
0 37 1 132 4 0 0 1 1172
0 29 1 229 4 0 0 0 1269
1 33 1 389 5 0 0 1 1429
0 30 1 466 5 0 1 2 1506
0 36 1 140 5 0 0 0 1180
0 37 1 334 7 0 2 17 1374
1 28 1 202 4 0 0 1 1242
1 26 1 282 3 0 3 7 1322
1 29 1 173 1 0 2 5 1213
1 27 1 0 5 0 2 8 1040
1 32 1 477 4 0 0 0 1517
0 35 1 172 4 0 0 1 1212
1 30 1 466 4 0 0 32 1506
0 28 1 254 7 0 0 0 1294
1 26 0 344 7 0 0 3 1384
0 27 1 188 6 0 5 4 1228
1 26 0 360 4 0 0 1 1400
0 33 1 174 3 0 0 0 1214
1 31 1 334 8 0 0 7 1374
0 32 1 282 4 0 3 7 1322
0 29 1 254 8 0 0 0 1294
1 29 1 466 4 0 0 0 1506
1 27 1 379 5 0 1 0 1419
1 27 1 413 7 0 0 0 1453
1 28 1 250 3 0 0 1 1290
1 31 1 173 5 0 0 3 1213
1 33 1 477 7 0 0 0 1517
0 37 1 256 4 0 1 0 1296
1 30 1 256 3 0 0 1 1296
1 27 0 429 7 1 3 9 1469
0 26 1 429 5 1 2 15 1469
1 30 1 429 4 1 4 5 1469
0 25 1 429 4 1 10 30 1469
1 29 0 429 7 1 1 1 1469
1 26 1 429 6 1 0 0 1469
1 30 1 429 5 1 2 0 1469
0 25 1 210 4 1 0 1 1250
0 32 1 429 8 1 4 5 1469
0 27 1 429 5 1 0 0 1469
0 28 1 125 3 1 2 0 1165
0 33 1 429 5 1 2 0 1469
0 27 1 429 5 1 2 7 1469
1 25 1 319 5 1 0 0 1359
0 26 1 319 5 1 0 1 1359
1 36 1 429 5 1 2 5 1469
0 26 1 429 3 1 1 1 1469
0 32 1 210 5 1 0 1 1250
1 24 1 429 4 1 2 2 1469
0 29 1 276 5 1 0 0 1316
1 27 1 429 5 1 2 20 1469
0 31 1 250 4 1 0 0 1290
1 24 0 429 5 1 3 5 1469
0 31 1 429 5 1 0 1 1469
0 36 1 250 4 1 1 0 1290
1 30 1 429 3 1 0 0 1469
0 27 1 429 3 1 1 5 1469
1 29 0 429 3 1 0 0 1469
0 29 1 429 3 1 0 0 1469
0 28 1 429 5 1 0 0 1469
0 32 1 429 5 1 0 0 1469
0 34 0 429 5 1 0 0 1469
0 38 1 429 5 1 1 0 1469
0 27 1 429 3 1 0 0 1469
0 28 1 429 5 1 1 1 1469
1 37 0 429 8 1 0 0 1469
0 32 1 429 4 1 0 0 1469
1 27 1 429 5 1 2 5 1469
0 25 0 429 5 1 0 1 1469
0 27 1 429 5 1 0 1 1469
0 34 1 429 5 1 1 2 1469
0 31 0 429 4 1 0 0 1469
1 28 0 429 6 1 1 0 1469
0 34 1 429 8 1 0 0 1469
0 25 1 429 6 1 1 2 1469
1 30 1 429 5 1 1 1 1469
0 27 1 429 5 1 1 10 1469
0 25 1 429 7 1 0 0 1469
0 29 1 429 8 1 0 1 1469
0 30 1 429 4 1 0 0 1469
1 31 1 429 6 1 1 2 1469
1 31 1 429 6 1 0 0 1469
0 26 0 429 4 1 0 0 1469
0 33 1 210 4 1 0 1 1250
0 30 1 429 7 1 1 3 1469
0 31 1 429 5 1 1 2 1469
0 36 1 296 4 1 0 1 1336
0 28 1 296 7 1 0 1 1336
0 34 1 142 6 1 3 0 1182
1 25 1 200 5 1 1 7 1240
0 38 1 168 6 1 0 0 1208
0 28 1 200 6 1 1 2 1240
1 33 1 239 6 1 0 1 1279
0 27 1 286 5 1 1 1 1326
0 31 1 296 3 1 0 1 1336
0 29 1 168 1 1 5 3 1208
0 31 1 168 4 1 1 4 1208
0 27 1 200 5 1 1 5 1240
0 28 1 296 4 1 3 10 1336
1 27 1 176 7 1 2 15 1216
0 33 1 286 5 1 0 0 1326
1 28 1 176 4 1 0 1 1216
0 32 1 286 5 1 0 0 1326
0 27 1 340 5 1 0 0 1380
1 31 1 176 4 1 2 2 1216
0 33 1 454 5 1 0 0 1494
0 27 1 200 4 1 1 2 1240
0 35 1 296 5 1 0 0 1336
0 36 1 168 4 1 2 2 1208
0 41 1 286 2 1 1 0 1326
0 27 1 296 4 1 0 0 1336
0 29 1 296 0 1 0 0 1336
0 31 1 296 2 1 3 2 1336
0 31 1 286 4 1 0 1 1326
1 26 1 168 4 1 0 1 1208
1 38 1 152 3 1 1 0 1192
1 30 1 296 4 1 1 0 1336
0 32 1 239 5 1 3 4 1279
0 33 1 239 8 1 1 1 1279
0 28 1 296 6 1 2 15 1336
0 28 1 200 3 1 2 0 1240
1 30 1 340 4 1 1 1 1380
0 29 1 286 4 1 10 23 1326
1 36 0 286 5 1 0 1 1326
1 26 1 296 4 1 0 0 1336
1 26 0 296 5 1 0 1 1336
0 32 1 296 4 1 1 5 1336
0 31 1 296 4 1 2 0 1336
0 31 1 296 4 1 0 0 1336
0 35 1 296 5 1 0 0 1336
1 34 1 436 7 1 0 1 1476
0 30 1 436 7 1 0 1 1476
1 28 1 214 4 1 0 0 1254
0 32 1 436 8 1 0 1 1476
0 26 1 436 5 1 1 6 1476
0 28 1 0 7 1 0 0 1040
0 26 1 436 2 1 3 22 1476
0 27 1 436 4 1 2 1 1476
0 29 1 436 2 1 0 0 1476
0 26 1 436 5 1 1 0 1476
1 28 0 436 7 1 0 0 1476
1 26 0 436 4 1 0 0 1476
0 36 1 436 7 1 0 0 1476
0 26 1 436 5 1 0 1 1476
1 35 0 436 9 1 0 0 1476
1 26 1 436 7 1 0 1 1476
0 34 1 436 5 1 0 2 1476
1 28 1 392 5 1 1 1 1432
1 30 1 436 5 1 0 2 1476
0 29 1 436 4 1 0 2 1476
0 29 1 436 4 1 0 1 1476
0 32 1 214 4 1 0 1 1254
0 32 1 130 3 1 3 6 1170
0 34 1 237 5 1 0 0 1277
0 28 1 436 4 1 0 0 1476
1 27 0 436 4 1 0 1 1476
1 26 1 436 5 1 2 7 1476
0 40 1 180 8 1 7 3 1220
0 27 1 436 3 1 1 6 1476
0 30 1 436 3 1 0 1 1476
1 27 1 436 7 1 0 1 1476
0 28 0 436 5 1 2 3 1476
0 31 1 436 3 1 0 0 1476
0 27 1 436 4 1 0 1 1476
0 30 1 436 5 1 0 1 1476
0 32 1 237 5 1 0 1 1277
0 31 1 436 5 1 1 2 1476
1 26 1 436 3 1 0 0 1476
1 26 1 436 3 1 0 0 1476
0 27 1 436 4 1 0 0 1476
1 27 1 436 5 1 1 2 1476
0 26 1 436 5 1 0 0 1476
0 31 1 214 5 1 0 0 1254
1 28 1 392 4 1 1 5 1432
0 28 1 340 3 1 0 1 1380
0 34 1 217 4 1 0 1 1257
1 35 1 317 8 1 0 1 1357
1 31 1 333 7 1 2 4 1373
0 27 1 186 4 1 0 3 1226
1 40 1 249 5 1 0 0 1289
0 28 1 333 5 1 0 1 1373
1 32 1 317 5 1 0 1 1357
1 28 1 249 7 1 5 0 1289
1 27 1 333 4 1 4 0 1373
0 32 1 333 5 1 0 1 1373
1 26 1 340 6 1 0 1 1380
0 27 1 333 4 1 4 0 1373
0 30 1 333 5 1 1 1 1373
0 29 1 186 2 1 0 0 1226
0 34 1 249 8 1 0 0 1289
0 26 1 174 2 1 0 0 1214
0 28 1 186 4 1 0 1 1226
1 29 1 340 5 1 0 0 1380
0 26 1 186 7 1 3 13 1226
0 26 1 186 5 1 1 0 1226
1 34 1 217 7 1 0 0 1257
0 28 1 217 4 1 0 0 1257
0 28 1 317 4 1 0 1 1357
0 30 1 317 5 1 0 2 1357
0 31 1 317 5 1 0 0 1357
0 32 1 217 5 1 1 7 1257
0 34 1 160 3 1 0 1 1200
1 31 1 333 5 1 0 1 1373
1 27 1 340 5 1 0 0 1380
1 27 1 333 5 1 0 1 1373
0 30 1 333 3 1 0 0 1373
0 34 1 174 3 1 0 1 1214
0 43 1 217 3 1 1 6 1257
0 28 1 217 3 1 0 4 1257
0 40 1 217 3 1 2 3 1257
0 28 1 317 4 1 0 0 1357
0 31 1 186 4 1 0 1 1226
0 38 1 174 7 1 0 0 1214
0 32 1 0 3 1 0 1 1040
1 28 1 249 4 1 0 0 1289
1 29 0 333 4 1 0 2 1373
1 34 1 340 4 1 0 1 1380
1 25 0 333 7 1 0 0 1373
0 27 1 333 3 1 0 0 1373
1 29 0 317 5 1 0 0 1357
0 29 1 340 4 1 4 9 1380
1 27 0 340 5 1 2 40 1380
0 29 1 217 6 1 0 0 1257
;
Title "Poisson regression for rate data";
Data articles;
   set postdoc;
Label pdoc='Receiving postdoctoral training or not'
      arts='# articles published by the biochemists before they received their degrees'
      cits='# citations to those articles counted in Science Citation Index'
	  age='Age in years at completion of the PhD'
	  mar='marital status'
	  doc='measure of the prestige of the doctoral institution in the field'
	  und='measure of selectivity of the person undergraduate institution'
	  agri='degree from an agricultural department or not'
	  docid='ID number of the doctoral institution' ;
	  proc freq data=articles; run;
proc genmod data=articles;
	Class mar (ref="0");
   model cits= age mar doc agri und /Dist=Poisson Link=log;
   estimate "Agricultural vs. other schools" agri 1 /exp;	*exp for cont. var;
   estimate "Married vs. not married" mar 1 -1 /exp;   *exp for dummy var;
   title2 'Overdispersion the variance often much greater than the estimated one';
run;
proc genmod;
   model cits= age mar doc agri und /Dist=Poisson Link=log pscale;
   title2 'Method 2 Correcting overdispersion with scale';
run;
/*---------------------------------------------------------*/
/*A sample of patient visits to 125 physicians obtained by */
/*investigator coding of 121 audio tapes. To standardize   */
/*for length of the session, define a var LMIN=ln(MINUTES) */
data prognosi;
input lengthpx ptage ptsex ezcompt mdlikept surgeon claims minutes;
datalines;
12 20 0 5 4 1 2 7
0 24 0 4 4 1 7 6
1 26 0 3 3 1 2 20
0 57 0 5 4 1 2 15
24 38 1 5 3 1 4 5
4 33 1 5 4 1 0 5
3 58 0 5 5 1 2 15
3 51 0 5 5 1 3 5
15 51 1 5 3 1 6 6
2 26 1 3 3 1 2 20
2 50 0 5 4 1 0 10
24 54 1 5 5 1 0 .
0 28 0 4 4 1 3 10
8 54 1 2 3 1 3 17
6 71 1 5 4 1 0 15
20 49 1 4 4 1 0 7
14 58 1 5 5 1 0 30
9 53 0 4 3 1 3 10
0 71 1 4 4 1 4 20
4 18 0 4 3 1 0 20
2 32 1 5 3 1 8 .
11 19 0 5 5 1 4 15
0 72 0 5 4 1 3 30
21 35 1 5 5 1 0 15
1 43 1 3 3 1 4 5
0 67 0 5 5 0 0 5
2 82 1 5 5 0 0 15
0 70 0 4 4 0 0 15
4 75 1 3 4 0 2 10
0 87 1 2 3 0 0 15
0 74 1 5 5 0 2 20
0 83 0 4 4 0 0 14
0 47 1 5 5 0 3 12
0 81 0 4 5 0 2 15
0 42 1 2 2 0 0 30
2 50 0 4 4 0 0 10
1 60 1 5 5 0 0 10
0 42 1 5 4 0 2 8
2 76 1 5 3 0 0 20
10 54 0 5 4 0 0 15
0 48 1 4 3 0 4 25
0 61 0 5 4 0 0 20
0 53 0 4 3 0 0 25
4 72 1 5 5 0 2 20
0 52 0 4 3 0 3 10
1 75 1 2 3 0 0 12
0 51 0 5 5 0 0 .
0 62 0 3 3 0 3 20
9 68 1 3 3 0 2 15
1 48 0 5 4 1 5 5
6 59 1 5 4 1 5 12
1 44 1 5 4 1 3 20
0 26 1 4 4 1 0 20
0 32 1 5 4 1 0 15
5 53 0 5 4 1 3 10
0 70 1 5 5 1 3 12
2 53 1 5 5 1 0 8
6 44 1 5 4 1 11 8
17 50 1 5 5 1 0 15
5 63 0 5 4 1 5 5
2 74 1 5 5 1 0 10
0 26 1 5 5 1 3 15
7 41 1 5 4 1 3 5
12 35 0 5 4 1 3 25
8 51 0 3 1 1 0 10
20 72 1 5 5 1 4 18
3 56 0 4 4 1 0 15
0 84 1 5 5 1 0 10
0 58 0 5 2 1 0 15
0 32 0 4 3 1 0 10
9 65 1 5 5 1 0 15
5 63 0 2 3 1 6 15
0 42 0 5 5 1 0 3
7 32 0 5 4 1 3 5
3 38 1 4 4 1 2 15
4 57 1 4 4 1 4 15
6 57 1 5 4 1 0 10
1 52 0 3 2 1 6 15
0 30 0 5 3 1 0 10
0 25 0 4 4 1 4 15
7 25 0 4 4 1 5 20
3 67 1 3 3 1 5 10
8 41 0 3 2 1 2 18
2 40 1 5 4 1 0 15
0 41 0 5 5 1 3 20
9 39 0 3 3 1 0 10
0 38 1 3 2 1 2 15
0 46 0 5 4 1 0 15
7 62 0 5 5 1 0 20
2 76 1 5 4 1 3 10
1 44 0 3 3 0 2 10
0 34 0 5 5 0 3 45
2 61 0 4 4 0 4 .
0 60 0 5 5 0 0 12
4 44 1 5 5 0 2 45
0 42 1 5 5 0 3 15
4 78 0 4 5 0 2 15
0 86 1 3 4 0 0 30
0 38 0 4 3 0 4 10
0 64 1 5 4 0 2 6
9 73 1 2 4 0 3 12
0 22 0 4 4 0 2 5
4 47 0 4 4 0 5 13
0 29 0 4 3 0 2 25
0 87 0 2 4 0 0 15
0 81 0 4 5 0 3 20
6 78 0 4 4 0 0 10
0 71 0 3 3 0 2 5
0 49 0 2 3 0 2 20
0 60 0 4 4 0 3 12
1 69 0 5 5 0 0 17
2 73 1 5 5 0 0 15
0 58 0 4 5 0 0 22
0 44 1 5 4 0 0 15
0 55 1 4 3 0 0 30
1 71 0 4 3 0 0 20
6 22 1 5 4 0 0 15
0 40 0 5 4 0 3 15
1 84 0 2 5 0 0 20
0 75 0 4 4 0 2 10
2 53 1 3 3 0 2 15
2 68 0 4 4 0 3 10
2 49 1 5 3 0 0 15
2 73 0 5 4 0 0 10
0 56 0 4 2 0 0 15
;
run;
Proc univariate;
	var lengthpx;
	histogram /vscale=percent normal(noprint) midpoints=0 to 24 by 1;	
	title "# utterances devoted by doc or patients to prognostic material";
run;
Proc SGPlot;
histogram lengthpx/showbins binwidth=1 ;
title "# utterances devoted by doc or patients to prognostic material";
run;
data prog2;
set prognosi;
lmin=log(minutes);
Label lengthpx='# utterances devoted by doc or patients to prognostic material'
      ptage='Patient�s age'
      ptsex="Patient�s sex (1 if male, otherwise 0 )"
      ezcompt="Doctor�s rating of how easy it was to communicate with the patient (1-5)"
      mdlikept="Doctor�s rating of how much he liked the patient(1-5)"
      surgeon="Doctor specialty ( 1 if a surgeon, otherwise 0)"
      claims="Number of malpractice claims filed against the doctor"
      minutes='Length of the visit in minutes';
proc genmod; 
     model lengthpx = ptage ptsex ezcompt mdlikept surgeon claims/ 
     offset=lmin d=p pscale;
run;