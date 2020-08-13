--
-- Created by IntelliJ IDEA.
-- User: Djyss
-- Date: 21/06/2017
-- Time: 14:27
-- To change this template use File | Settings | File Templates.

local vehiclesOut = {}

local locations = {
    {hidden = false, name= 'Garage', x = -1125.337, y= -862.8168, z= 12.57277,  spawn_x = -1125.337, spawn_y= -862.8168, spawn_z= 12.57277, heading = 38.341, activationDist=1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable=1},
    {hidden = false, name= 'Garage', x = 215.124, y= -791.377, z= 29.856,  spawn_x = 216.257, spawn_y= -787.11, spawn_z= 29.856, heading = 336.7042, activationDist=1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable=1},
    {hidden = false, name= 'Garage', x = -738.2580, y= -60.6600, z= 40.7532, spawn_x = -743.191, spawn_y= -63.3786, spawn_z= 40.7526, heading = 117.1099, activationDist=1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
    {hidden = false, name= 'Garage', x = 891.363098144531, y= -71.0792617797852, z= 77.7303, spawn_x = 894.326, spawn_y= -66.2807, spawn_z= 77.7303, heading = 329.1869, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
    {hidden = true, name= 'Garage', x = 110.8933, y= 6626.691, z= 30.787, spawn_x = 110.8933, spawn_y= 6626.691, spawn_z=  30.787, heading = 222.9, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
    {hidden = false, name= 'Garage', x = 1950.88012695313, y= 3773.8466796875, z= 31.1720504760742, spawn_x = 1955.75329589844, spawn_y= 3770.85205078125, spawn_z=  31.2003135681152, heading = 29.014, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
    {hidden = false, name= 'Garage', x = -778.530639648438, y= -2378.4384765625, z= 13.5707263946533, spawn_x = -781.188659667969, spawn_y= -2384.53588867188, spawn_z= 13.5707, heading = 330.2187, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = false, name= 'Garage', x = -1543.2930908204, y= -574.85968017578, z= 24.707801818848, spawn_x = -1537.3896484375, spawn_y= -577.81103515625, spawn_z= 24.707790374756, heading = 34.322151184082, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	
	{hidden = false, name= 'Garage', x = 148.8552, y= -1336.4526, z= 28.20228, spawn_x = 148.8552, spawn_y= -1336.4526, spawn_z= 28.20228, heading = 53.28, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	
	{hidden = true, name= 'Garage', x = -19.838235855102, y= -705.84576416016, z= 31.338062286376, spawn_x = -19.838235855102, spawn_y= -705.84576416016, spawn_z= 31.338062286376, heading = 332.40, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage Hopital', x = 341.3978, y= -560.2192, z= 27.74, spawn_x = 341.3978, spawn_y= -560.2192, spawn_z= 27.74, heading = 344.297, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage Mecano', x = -355.926, y= -115.4979, z= 37.6966, spawn_x = -355.926, spawn_y= -115.4979, spawn_z= 37.6966, heading = 74.0, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage Bennys', x = -190.0316, y = -1284.408, z = 30.2277, spawn_x = -190.0316, spawn_y= -1284.408, spawn_z= 30.2277, heading = 269.37298, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},

	{hidden = true,name= 'Garage Central 2', x = 233.8548, y= -788.6782, z= 29.60606, spawn_x = 231.89797973632, spawn_y= -793.53503417968, spawn_z= 29.58818435669, heading = 163.3666076, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	
	{hidden = true,name= 'Garage Police', x = 438.6779, y= -1026.942, z= 27.78675, spawn_x = 438.6779, spawn_y= -1026.942, spawn_z= 27.78675, heading = 34.322151184082, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true,name= 'Garage Pecheur', x = -3235.654, y= 975.796, z= 11.9, spawn_x = -3235.654, spawn_y= 975.796, spawn_z= 11.9, heading = 182.10, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true,name= 'Garage BurgerShot', x = -1165.092, y= -889.776, z= 13.2, spawn_x = -1165.092, spawn_y= -889.776, spawn_z= 13.2, heading = 127.177, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true,name= 'Garage Electricien', x = 751.4788, y= 121.6213, z= 77.6, spawn_x = 751.4788, spawn_y= 121.6213, spawn_z= 77.6, heading = 245.5, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage Journalistes', x = -617.752, y = -939.1443, z = 21.089, spawn_x = -617.752, spawn_y= -939.1443, spawn_z= 21.089, heading = 81.2, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	
	{hidden = true,name= 'Garage X', x = -42.1274, y = 1880.5, z = 194.99, spawn_x = -42.1274, spawn_y= 1880.5, spawn_z= 194.99, heading = 156.28, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true,name= 'Garage X', x = 785.547, y = 1280.4768, z = 359.2968, spawn_x = 785.547, spawn_y= 1280.4768, spawn_z= 359.2968, heading = 269.16, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true,name= 'Garage X', x = 1098.389, y = -333.674, z = 359.2968, spawn_x = 1098.389, spawn_y= -333.674, spawn_z= 66.21446, heading = 125.446, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true,name= 'Garage X', x = -36.34978, y = -2518.083496, z = 5.010, spawn_x = -36.34978, spawn_y= -2518.083496, spawn_z= 5.010, heading = 145.1216, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage Mafia Russe', x = -168.2752532959, y= 916.73626708984, z= 234.65559387208, spawn_x = -159.99676513672, spawn_y= 927.03430175782, spawn_z= 234.65559387208, heading = 224.81007385254, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
    --{hidden = true, name= 'Garage', x = -1545.5762939454, y= -399.00625610352, z= 40.987686157226, spawn_x = -1545.5762939454, spawn_y= -399.00625610352, spawn_z= 40.987686157226, heading = 48.797691345214, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage', x = 888.07299804688, y= -3236.1999511718, z= -99.277687072754, spawn_x = 883.2290649414, spawn_y= -3240.1762695312, spawn_z= -99.278053283692, heading = 176.57168579102, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garages Asu', x = -124.22744750976, y= 1008.053527832, z= 234.73190307618, spawn_x = -124.22744750976, spawn_y= 1008.053527832, spawn_z= 234.73190307618, heading = 196.32933044434, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garages Goto', x = -933.2993, y= 213.0509, z= 66.46452, spawn_x = -933.2993, spawn_y= 213.0509, spawn_z= 66.46452, heading = 166.71238708496, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garages Yiddish', x = -124.2095, y= 1006.742, z= 234.7323, spawn_x = -124.2095, spawn_y= 1006.742, spawn_z= 235.7323, heading = 193.73919677734, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
    {hidden = true, name= 'Garage Vagos', x = 332.3957, y= -2031.556, z= 20.1898, spawn_x = 332.3957, spawn_y= -2031.556, spawn_z= 20.1898, heading = 125.332, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage Black Stones', x = 1301.63269, y = -1706.653, z = 54.0781, spawn_x = 1301.63269, spawn_y= -1706.653, spawn_z= 54.0781, heading = 200.313, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage Bratva', x = -1791.106, y = 458.748, z = 127.3082, spawn_x = -1791.106, spawn_y= 458.748, spawn_z= 127.3082, heading = 99.7098, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage Bloods', x = 524.9112, y = -1759.7620, z = 27.69227, spawn_x = 524.9112, spawn_y= -1759.7620, spawn_z= 27.69227, heading = 70.4, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage Oneil', x = 2413.3325, y = 4990.9746, z = 45.2544, spawn_x = 2413.3325, spawn_y= 4990.9746, spawn_z= 45.2544, heading = 133.16, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage Bratva2', x = -159.51515, y = 926.24792, z = 234.65557, spawn_x = -159.51515, spawn_y= 926.24792, spawn_z= 234.65557, heading = 223.3, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage Kkangpae', x = -643.42559, y = -1133.82, z = 10.98687, spawn_x = -643.42559, spawn_y= -1133.82, spawn_z= 10.98687, heading = 333.64, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage Kkangpae', x = -675.39239, y = -1176.9476, z = 9.6126, spawn_x = -675.39239, spawn_y= -1176.9476, spawn_z= 9.6126, heading = 308.77, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage Magliana', x = -1526.9399, y = 84.2886, z = 55.5840, spawn_x = -1526.9399, spawn_y= 84.2886, spawn_z= 55.5840, heading = 1.285257, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage Surenos', x = -1446.48571, y = -674.897766, z = 25.46681, spawn_x = -1446.48571, spawn_y= -674.897766, spawn_z= 25.46681, heading = 216.80322, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage Paint', x = -39.31235, y = -1215.81347, z = 28.334751, spawn_x = -39.31235, spawn_y= -1215.81347, spawn_z= 28.3347, heading = 176.189, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage Triades', x = -761.1876, y = -1024.176, z = 12.128, spawn_x = -761.1876, spawn_y= -1024.176, spawn_z= 12.128, heading = 294.3, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage Families', x = -187.42, y = -1586.413, z = 33.826, spawn_x = -187.42, spawn_y= -1586.413, spawn_z= 33.826, heading = 234.245, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage Lost', x = 985.1593, y = -138.3359, z = 72.09, spawn_x = 985.1593, spawn_y= -138.3359, spawn_z= 72.09, heading = 51.79, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage Ballas', x = 87.11, y = -1968.522, z = 19.7474, spawn_x = 87.11, spawn_y= -1968.522, spawn_z= 19.7474, heading = 322.1275, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage peintres', x = -1147.17, y = -534.0001, z = 31.0849, spawn_x = -1147.17, spawn_y= -534.0001, spawn_z= 31.0849, heading = 33.2, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage The Palace', x = 769.5557, y = -1328.607, z = 25.23279, spawn_x = 769.5557, spawn_y= -1328.607, spawn_z= 25.23279, heading = 273.0286, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage Occas', x = -771.0372, y = -233.2759, z = 36.07966, spawn_x = -771.0372, spawn_y= -233.2759, spawn_z= 36.07966, heading = 200.0951, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage le domaine', x = -1922.972, y = 2040.606, z = 139.7347, spawn_x = -1922.972, spawn_y= 2040.606, spawn_z= 139.7347, heading = 269.59, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage ELI', x = 1502.0922, y = 3590.393, z = 34.39159, spawn_x = 1502.0922, spawn_y= 3590.393, spawn_z= 34.39159, heading = 120.939, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage Arena CSGO', x = -1582.526, y = -1033.206, z = 12.0184, spawn_x = -1582.526, spawn_y= -1033.206, spawn_z= 12.0184, heading = 20.26, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage Transporteur', x = -961.91, y = -2965.0698, z = 12.945, spawn_x = -961.91, spawn_y= -2965.0698, spawn_z= 12.945, heading = 65.48, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage Transporteur', x = 2111.421, y = 4769.122, z = 40.2269, spawn_x = 2111.421, spawn_y= 4769.122, spawn_z= 40.22692, heading = 99.979, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{hidden = true, name= 'Garage Transporteur', x = 1765.683, y = 3309.631, z = 40.1646, spawn_x = 1765.683, spawn_y= 3309.631, spawn_z= 40.1646, heading = 248.0, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage Ballas', x = -147.94244, y= -1665.1356, z= 31.8345, spawn_x = -155.8679, spawn_y= -1657.22143, spawn_z= 31.7951, heading = 38.6, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage Meute', x = 112.346, y= -1945.838, z= 19.7324, spawn_x = 116.4032, spawn_y= -1949.2, spawn_z= 19.71, heading = 70.0, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage Gitans', x = 103.3374, y= 3696.246, z= 38.72651, spawn_x = 103.3374, spawn_y= 3696.246, spawn_z= 38.72651, heading = 70.0, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage Cartel', x = -2662.4167480468, y= 1307.340209961, z= 146.11862182618, spawn_x = -2662.4167480468, spawn_y= 1307.340209961, spawn_z= 146.11862182618, heading = 268.7188, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage Blackbird', x = -1071.5518798828, y= -1669.7352294922, z= 3.4421191215516, spawn_x = -1071.5518798828, spawn_y= -1669.7352294922, spawn_z= 3.4421191215516, heading = 37.217887878418, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage Aztecas', x = 1227.8712158204, y= -1605.628540039, z= 50.702407836914, spawn_x = 1227.8712158204, spawn_y= -1605.628540039, spawn_z= 50.702407836914, heading = 217.42533874512, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage Savastano', x = -1542.021, y= 887.0318, z= 180.4887, spawn_x = -1542.021, spawn_y= 887.0318, spawn_z= 180.4887, heading = 200.0, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage I.C.A', x = -1094.9638671875, y= 4947.51171875, z= 217.3542175293, spawn_x = -1094.9638671875, spawn_y= 4947.51171875, spawn_z= 217.3542175293, heading = 253.371, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage B&C', x = -1526.824, y= 83.30553, z= 55.58845, spawn_x = -1526.824, spawn_y= 83.30553, spawn_z= 55.58845, heading = 0.0, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage Punisher', x = -521.1459, y= -2904.607, z= 5.000386, spawn_x = -526.1664, spawn_y= -2898.494, spawn_z= 5.000388, heading = 0.0, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage Crips', x = -27.8349, y= -1495.4476, z= 29.36208, spawn_x = -27.8349, spawn_y= -1495.4476, spawn_z= 29.36208, heading = 315.0, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage Arena war', x = -223.6322, y= -2064.609, z= 26.62041, spawn_x = -223.6322, spawn_y= -2064.609, spawn_z= 26.62041, heading = 45.0, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage vendeur vehicule', x = -1132.4594726562, y= -2002.5814208984, z= 12.17469406128, spawn_x = -1129.4871826172, spawn_y= -1999.6815185546, spawn_z= 12.172518730164, heading = 310.0, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage tch', x = 3598.971, y= 3669.558, z= 32.87174987793, spawn_x = 3598.971, spawn_y= 3669.558, spawn_z= 32.87174987793, heading = 262.7550, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage yakuza', x = -703.40399169922, y= -861.08447265625, z= 22.414451599122, spawn_x = -703.40399169922, spawn_y= -861.08447265625, spawn_z= 22.414451599122, heading = 93.38166, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage guerilla', x = 2548.9243164062, y= -385.22079467774, z= 91.992820739746, spawn_x = 2548.9243164062, spawn_y= -385.22079467774, spawn_z= 91.992820739746, heading = 269.1832, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage ms13', x = 1297.471, y= -1730.247, z= 52.81277, spawn_x = 1297.471, spawn_y= -1730.247, spawn_z= 52.81277, heading = 0.0, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage unicorn', x = 144.39263916, y= -1283.30505, z= 28.2746143, spawn_x = 144.39263916, spawn_y= -1283.30505, spawn_z= 28.2746143, heading = 208.909, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage Biker', x = 1001.517, y= -3171.369, z= -39.90742, spawn_x = 1001.517, spawn_y= -3171.369, spawn_z= -39.90742, heading = 355.352, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage Madrazo', x = -2588.33984375, y= 1931.1484375, z= 166.30374, spawn_x = -2588.33984375, spawn_y= 1931.1484375, spawn_z= 166.30374, heading = 294.5062, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage car race', x = 276.511718, y= -3230.1440, z= 4.79026937, spawn_x = 276.511718, spawn_y= -3230.1440, spawn_z= 4.79026937, heading = 345.927, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage madrazo', x = -464.710296, y= 864.7634, z= 230.8710, spawn_x = -464.710296, spawn_y= 864.7634, spawn_z= 230.8710, heading = 269.4445, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage x', x = -1791.4694824218, y= 461.29721069336, z= 127.3080139, spawn_x = -1788.5858, spawn_y= 455.952026, spawn_z= 127.3080, heading = 280.15, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage xx', x = 3071.30786, y= 2148.88549, z= 2.3357617, spawn_x = 3071.30786, spawn_y= 2148.88549, spawn_z= 2.3357617, heading = 194.9568, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage xxx', x = 530.1422119, y= -1767.06982, z= 27.7080059, spawn_x = 530.1422119, spawn_y= -1767.06982, spawn_z= 27.7080059, heading = 8.651, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage xxxx', x = 201.382, y= -1020.114, z= -99.9999847, spawn_x = 201.382, spawn_y= -1020.114, spawn_z= -99.9999847, heading = 0.0, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage Cross', x = 822.949157, y= 2365.335693, z= 51.451263, spawn_x = 825.436096, spawn_y= 2373.139160, spawn_z= 51.41054534, heading = 256.7279, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{hidden = true, name= 'Garage Sombreros', x = -2311.8352, y= 282.940460, z= 168.4671936, spawn_x = -2311.8352, spawn_y= 282.940460, spawn_z= 168.4671936, heading = 66.43625, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{ hidden = true, name= 'Garage Gouv', x = -675.392, y = -1176.9476, z = 9.6126,  spawn_x = -675.392,  spawn_y = -1176.9476, spawn_z = 9.6126,	heading = 308.77,  activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	
	{ hidden = true, name= 'Garage appart', x = -935.41680908204, y = -454.67175292968, z = 36.2977142333, spawn_x = -935.41680908204, spawn_y = -454.67175292968, spawn_z = 36.2977142333,		heading = 27.94657516479, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{ hidden = true, name= 'Garage appart', x = -189.86543273926, y = 503.10061645508, z = 133.2745819091, spawn_x = -189.86543273926, spawn_y = 503.10061645508,  spawn_z = 133.2745819091,	heading = 282.8411254882, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{ hidden = true, name= 'Garage appart', x = -800.4965209961, y = 332.78015136718, z = 84.700477600098, spawn_x = -800.4965209961,  spawn_y = 332.78015136718,  spawn_z = 84.700477600098,	heading = 180.7031555175, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{ hidden = true, name= 'Garage appart', x = -1900.3537597656, y = -560.51104736328, z = 10.7978696823, spawn_x = -1900.3537597656, spawn_y = -560.51104736328, spawn_z = 10.7978696823,		heading = 308.6173400879, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{ hidden = true, name= 'Garage appart', x = -53.877975463868, y = -577.80053710938, z = 36.3347816467, spawn_x = -53.877975463868, spawn_y = -577.80053710938, spawn_z = 36.3347816467,		heading = 70.21297454834, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{ hidden = true, name= 'Garage appart', x = -486.59713745118, y = -674.43835449218, z = 31.8093719482, spawn_x = -486.59713745118, spawn_y = -674.43835449218, spawn_z = 31.8093719482,		heading = 352.8117065429, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{ hidden = true, name= 'Garage appart', x = 131.60409545898, y = 570.89056396484, z = 182.43405151368, spawn_x = 131.60409545898,  spawn_y = 570.89056396484,  spawn_z = 182.43405151368,	heading = 2.346646547317, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{ hidden = true, name= 'Garage appart', x = 391.11340332032, y = 432.88000488282, z = 142.15000915528, spawn_x = 391.11340332032,  spawn_y = 432.88000488282,  spawn_z = 142.15000915528,	heading = 262.7006225586, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{ hidden = true, name= 'Garage appart', x = 354.54705810546, y = 437.73574829102, z = 145.38874816894, spawn_x = 354.54705810546,  spawn_y = 437.73574829102,  spawn_z = 145.38874816894,	heading = 301.7997436523, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{ hidden = true, name= 'Garage appart', x = -619.09997558594, y = 52.373447418212, z = 42.73897552490, spawn_x = -619.09997558594, spawn_y = 52.373447418212,  spawn_z = 42.73897552490,	heading = 95.72347259521, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	
	--{name= 'Garages Vagos', x = 323.711059, y= -2030.27087, z= 19.8443489, spawn_x = 320.79385, spawn_y= -2033.95715, spawn_z= 19.71, heading = 70.0, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{name= 'Garages Yakuza', x = 149.050888, y= -1292.25439, z= 28.29607, spawn_x = 155.742279, spawn_y= -1293.17224, spawn_z= 28.0009479, heading = 120, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	--{name= 'Garages Bloods', x = 1279.2537841797, y= -1722.7653808594, z= 53.655078887939, spawn_x = 1283.150390625, spawn_y= -1731.6728515625, spawn_z= 51.770526885986, heading = 120, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	
	
	{hidden = false, name= 'Garages', x = 1201.628, y= -1545.858, z= 33.743, spawn_x = 1208.072, spawn_y= -1547.889, spawn_z= 33.743, heading = 55.880, activationDist= 1.5, markerWidth = 2.0001, markerType= 363, markerColor= 0, spawnable= 1},-- Garage Pompier Fire Station 7
	--{name= 'Garages', x = -1261.70178222656, y= -2168.9931640625, z= 13.5033721923828, spawn_x = -1261.70178222656, spawn_y= -2168.9931640625, spawn_z= 13.570725440979, heading = 190.2187, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1}, -- garage test aeroport tdlc
	--{name= 'Garages', x = -380.952758789063, y= -120.306831359863, z= 38.6536865234375, spawn_x = -380.952758789063, spawn_y= -120.306831359863, spawn_z= 38.6536865234375, heading = 190.2187, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1}, -- garage test mecano 6/6 tdlc

    {hidden = false, name= 'Marina', x = -892.246, y= -1382.75, z= 0.63417, spawn_x = -894.890625, spawn_y= -1378.25573730469, spawn_z=  0.634293559789658, heading = 292.5663, activationDist= 10.5, markerWidth = 2.0001, markerType= 356, markerColor= 3, spawnable= 2},
    {hidden = false, name= 'Marina', x = -830.409606933594, y= -1411.26635742188, z= 0.60538136959076, spawn_x = -830.326843261719, spawn_y= -1417.15441894531, spawn_z=  0.475613296031952, heading = 112.2187, activationDist= 10.5, markerWidth = 2.0001, markerType= 356, markerColor= 3, spawnable= 2},
    {hidden = false, name= 'Marina', x = -1800.93188476563, y= -1227.26208496094, z= 0.60127639770508, spawn_x = -1795.86682128906, spawn_y= -1232.21398925781, spawn_z= 0.589679062366486, heading = 322.2187, activationDist= 10.5, markerWidth = 2.0001, markerType= 356, markerColor= 3, spawnable= 2},
    {hidden = false, name= 'Marina', x = -1605.63903808594, y= 5258.59716796875, z= 1.08573627471924, spawn_x =-1602.40356445313, spawn_y= 5259.01123046875, spawn_z= 0.474358767271042, heading = 24.7684, activationDist= 10.5, markerWidth = 2.0001, markerType= 356, markerColor= 3, spawnable= 2},
    {hidden = false, name= 'Marina', x = 3373.74267578125, y= 5183.6533203125, z= 0.46024036407471, spawn_x = 3378.72412109375, spawn_y= 5189.5634765625, spawn_z= 0.391142189502716, heading = 257.578, activationDist= 10.5, markerWidth = 2.0001, markerType= 356, markerColor= 3, spawnable= 2},
    {hidden = false, name= 'Marina', x = 2842.19140625, y= -720.936340332031, z= 0.00004684925079, spawn_x = 2870.90258789063, spawn_y= -724.305786132813, spawn_z= 0.522374451160431, heading = 190.2187, activationDist= 10.5, markerWidth = 2.0001, markerType= 356, markerColor= 3, spawnable= 2},
    {hidden = false, name= 'Marina', x = 1333.29, y= 4269.36, z= 30.5031, spawn_x = 1333.74, spawn_y= 4263.69, spawn_z= 30.5031, heading = 244.2187, activationDist= 10.5, markerWidth = 2.0001, markerType= 356, markerColor= 3, spawnable= 2},
    --{hidden = true, name= 'Marina Gitan', x = 130.3559, y= 3789.969, z= 30.16343, spawn_x = 135.98, spawn_y= 3798.522, spawn_z= 30.28843, heading = 244.2187, activationDist= 10.5, markerWidth = 2.0001, markerType= 356, markerColor= 3, spawnable= 2},
    --{hidden = true, name= 'Marina Popov', x = -192.9562, y= 790.9164, z= 197.1075, spawn_x = -197.51579284668, spawn_y= 784.0297241211, spawn_z= 196.9965057373, heading = 319.95178222656, activationDist= 10.5, markerWidth = 2.0001, markerType= 356, markerColor= 3, spawnable= 2},
	--{hidden = true, name= 'Marina Punisher', x = -485.508, y= -2920.937, z= 5.000384, spawn_x = -478.7102, spawn_y= -2927.611, spawn_z= 1.603145, heading = 0.0, activationDist= 10.0, markerWidth = 2.0001, markerType= 356, markerColor= 3, spawnable= 2},
	--{hidden = true, name= 'Marina Cartel', x = 3092.090576, y= 2208.165283, z= 2.777247, spawn_x = 3088.07910, spawn_y= 2191.18408, spawn_z= -0.57606, heading = 77.4338, activationDist= 10.0, markerWidth = 2.0001, markerType= 356, markerColor= 3, spawnable= 2},
	{hidden = true, name= 'Marina Jetski', x = -2078.594238, y= 2603.043457, z= 1.0303122997, spawn_x = -2075.3239746, spawn_y= 2594.28320, spawn_z= -1.474367, heading = 200.16, activationDist= 10.0, markerWidth = 2.0001, markerType= 356, markerColor= 3, spawnable= 2},

    {hidden = true, name= 'Heliport', x = -8.39521, y= -636.8570556, z= 34.7241, spawn_x = -8.39521, spawn_y= -636.8570556, spawn_z= 34.7241, heading = 69.53989, activationDist= 5.0, markerWidth = 2.0001, markerType= 360, markerColor= 3, spawnable= 3},
    {hidden = false, name= 'Heliport', x = 1767.22290039063, y= 3252.03662109375, z= 40.6823348999023, spawn_x = 1770.21508789063, spawn_y= 3239.89013671875, spawn_z= 41.1217155456543, heading = 100.2187, activationDist= 5.0, markerWidth = 2.0001, markerType= 360, markerColor= 3, spawnable= 3},
    {hidden = false, name= 'Heliport', x = -718.352783203125, y= -1435.4462890625, z= 4.00052547454834, spawn_x = -724.53662109375, spawn_y= -1443.95397949219, spawn_z=  4.00051927566528, heading = 229.4153, activationDist= 5.0, markerWidth = 2.0001, markerType= 360, markerColor= 3, spawnable= 3},
	{hidden = false, name= 'Heliport', x = -772.3435, y= 152.5689, z= 68.3532, spawn_x = -772.1531, spawn_y= 146.348, spawn_z= 68.3532, heading = 229.4153, activationDist= 5.0, markerWidth = 2.0001, markerType= 360, markerColor= 3, spawnable= 3},
	{hidden = true, name= 'Heliport', x = -71.86143, y= -814.3373, z= 325.1751, spawn_x = -75.07388, spawn_y= -818.6015, spawn_z= 325.1751, heading = 229.4153, activationDist= 5.0, markerWidth = 2.0001, markerType= 360, markerColor= 3, spawnable= 3},
	--{hidden = true, name= 'Heliport popov', x = -161.90557861328, y= 904.2300415039, z= 241.1999053955, spawn_x = -161.90557861328, spawn_y= 904.2300415039, spawn_z= 241.1999053955, heading = 313.04348754882, activationDist= 1.5, markerWidth = 2.0001, markerType= 360, markerColor= 3, spawnable= 3},
	--{hidden = true, name= 'Heliport punisher', x = -508.3661, y= -2891.212, z= 16.45436, spawn_x = -508.3661, spawn_y= -2891.212, spawn_z= 16.45436, heading = 0.0, activationDist= 1.5, markerWidth = 2.0001, markerType= 360, markerColor= 3, spawnable= 3},
	{hidden = true, name= 'Heliport Magliana', x = -1605.68, y= 103.244, z= 61.8250, spawn_x = -1605.68, spawn_y= 103.244, spawn_z= 61.8250, heading = 178.0, activationDist= 5.0, markerWidth = 2.0001, markerType= 360, markerColor= 3, spawnable= 3},
	{hidden = true, name= 'Heliport asu et dimi', x = 22.572971343994, y= 544.21423339844, z= 178.55862426758, spawn_x = 22.572971343994, spawn_y= 544.21423339844, spawn_z= 178.55862426758, heading = 66.0, activationDist= 3.0, markerWidth = 2.0001, markerType= 360, markerColor= 3, spawnable= 3},
	{hidden = true, name= 'Heliport irish', x = -1908.766, y= 2059.806, z= 139.737, spawn_x = -1908.766, spawn_y= 2059.806, spawn_z= 139.737, heading = 249.61, activationDist= 3.0, markerWidth = 2.0001, markerType= 360, markerColor= 3, spawnable= 3},
	{hidden = true, name= 'Heliport aeroport', x = -1265.447, y= -3406.6577, z= 12.9401, spawn_x = -1265.447, spawn_y= -3406.6577, spawn_z= 12.9401, heading = 328.1584, activationDist= 3.0, markerWidth = 2.0001, markerType= 360, markerColor= 3, spawnable= 3},
	--{hidden = true, name= 'Heliport Guerilla', x = 2510.8020019532, y= -341.9821472168, z= 117.18634033204, spawn_x = 2510.8020019532, spawn_y= -341.9821472168, spawn_z= 117.18634033204, heading = 50.14, activationDist= 1.5, markerWidth = 2.0001, markerType= 360, markerColor= 3, spawnable= 3},
	--{hidden = true, name= 'Heliport Tchtch', x = 3553.014, y= 3724.14, z= 36.35, spawn_x = 3553.014, spawn_y= 3724.14, spawn_z= 36.35, heading = 0.0, activationDist= 1.5, markerWidth = 2.0001, markerType= 360, markerColor= 3, spawnable= 3},
	--{hidden = true, name= 'Heliport Unicorn', x = 165.2297, y= -1316.352, z= 33.33608, spawn_x = 165.2297, spawn_y= -1316.352, spawn_z= 33.33608, heading = 240.423, activationDist= 1.5, markerWidth = 2.0001, markerType= 360, markerColor= 3, spawnable= 3},
	--{hidden = true, name= 'Heliport X', x = 3058.7785644532, y= 2106.42456, z= 0.947231, spawn_x = 3058.7785644532, spawn_y= 2106.42456, spawn_z= 0.947231, heading = 168.08, activationDist= 1.5, markerWidth = 2.0001, markerType= 360, markerColor= 3, spawnable= 3},
	
	{hidden = false, name= 'Hangar a avion perso', x = -1686.55, y= -3149.37, z= 13.00, spawn_x = -1655.36, spawn_y= -3148.65, spawn_z= 13.00, heading = 330.0618, activationDist= 3.0, markerWidth = 2.0001, markerType= 359, markerColor= 3, spawnable= 4},
    {hidden = false, name= 'Hangar a avion perso', x = 1707.3915, y= 3270.3501, z= 40.20, spawn_x = 1708.8263, spawn_y= 3251.8335, spawn_z=  40.20, heading = 103.1159, activationDist= 3.0, markerWidth = 2.0001, markerType= 359, markerColor= 3, spawnable= 4},
}

local locations1 = {
    {name= 'Garages Perso', x = -3018.9565429688, y= 748.97863769531, z= 26.08762550354, spawn_x = -3017.0432128906, spawn_y= 740.05822753906, spawn_z= 26.087627410889, heading = 99.948463439941, activationDist=2.0001, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable=1},
    {name= 'Garages Privé', x = -818.65222167969, y= 184.76094055176, z= 71.258453369141, spawn_x = -812.32830810547, spawn_y= 187.23873901367, spawn_z= 71.470062255859, heading = 90.0, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{name= 'Garages Privé', x = 1414.392578125, y= 1118.3120117188, z= 113.83800506592, spawn_x = 1414.392578125, spawn_y= 1118.3120117188, spawn_z= 113.83800506592, heading = 88.596786499023, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{name= 'Garages Privé', x = 231.64659118652, y= -988.58679199219, z= -99.999969482422, spawn_x = 231.64659118652, spawn_y= -988.58679199219, spawn_z= -99.999969482422, heading = 175.45874023438, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{name= 'Garages Privé', x = -316.93218994141, y= 6309.5595703125, z= 31.28, spawn_x = -315.59869384766, spawn_y= 6313.2436523438, spawn_z= 31.0, heading = 46.184131622314, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
	{name= 'Garages Securité', x = -87.65, y= -815.59, z= 35.06, spawn_x = -81.67, spawn_y= -807.19, spawn_z= 35.51, heading = 339.45874023438, activationDist= 1.5, markerWidth = 2.0001, markerType= 50, markerColor= 3, spawnable= 1},
}


local lastvhl = 0
local price = nil
local Paid = false

local currentUiState = false
local currentspawnzone = {
    x=0,
    y=0,
    z=0
}

listedcar = 
{
	562680400, --APC
	159274291, --ARDENT
	-769147461, --CADDY3
	223240013, --CHEETAH2
	1897744184, --DUNE3
	-32236122, --HALFTRACK
	387748548, --HAULER2
	-1924433270, --INSURGENT3
	433954513, --NIGHTSHARK
	884483972, --OPPRESSOR
	177270108, --PHANTOM3
	-1210451983, --TAMPA3
	1356124575, --TECHNICAL3
	1504306544, --TORERO
	1502869817, --TRAILERLARGE
	-1100548694, --TRAILERS4
	-1881846085, --TRAILERSMALL2
	1939284556, --VAGNER
	917809321, --XA21
	-1216765807, --ADDER
	1283517198, --AIRBUS
	1560980623, --AIRTUG
	1672195559, --AKUMA
	767087018, --ALPHA
	1171614426, --AMBULANCE
	837858166, --ANNIHILATOR
	562680400, --APC
	159274291, --ARDENT
	-1207431159, --ARMYTANKER
	-1476447243, --ARMYTRAILER
	-1637149482, --ARMYTRAILER2
	-1809822327, --ASEA
	-1807623979, --ASEA2
	-1903012613, --ASTEROPE
	-2115793025, --AVARUS
	-2140431165, --BAGGER
	-399841706, --BALETRAILER
	-808831384, --BALLER
	142944341, --BALLER2
	1878062887, --BALLER3
	634118882, --BALLER4
	470404958, --BALLER5
	666166960, --BALLER6
	-1041692462, --BANSHEE
	633712403, --BANSHEE2
	-823509173, --BARRACKS
	1074326203, --BARRACKS2
	630371791, --BARRACKS3
	-114291515, --BATI
	-891462355, --BATI2
	2053223216, --BENSON
	1824333165, --BESRA
	1274868363, --BESTIAGTS
	86520421, --BF400
	1126868326, --BFINJECTION
	850991848, --BIFF
	-349601129, --BIFTA
	-16948145, --BISON
	2072156101, --BISON2
	1739845664, --BISON3
	850565707, --BJXL
	-1205801634, --BLADE
	-2128233223, --BLAZER
	-48031959, --BLAZER2
	-1269889662, --BLAZER3
	-440768424, --BLAZER4
	-1590337689, --BLAZER5
	-150975354, --BLIMP
	-613725916, --BLIMP2
	-344943009, --BLISTA
	1039032026, --BLISTA2
	-591651781, --BLISTA3
	1131912276, --BMX
	524108981, --BOATTRAILER
	1069929536, --BOBCATXL
	-1435919434, --BODHI2
	-1987130134, --BOXVILLE
	-233098306, --BOXVILLE2
	121658888, --BOXVILLE3
	444171386, --BOXVILLE4
	682434785, --BOXVILLE5
	-1479664699, --BRAWLER
	-305727417, --BRICKADE
	1549126457, --BRIOSO
	117401876, --BTYPE
	-831834716, --BTYPE2
	-602287871, --BTYPE3
	-682211828, --BUCCANEER
	-1013450936, --BUCCANEER2
	-304802106, --BUFFALO
	736902334, --BUFFALO2
	237764926, --BUFFALO3
	1886712733, --BULLDOZER
	-1696146015, --BULLET
	-1346687836, --BURRITO
	-907477130, --BURRITO2
	-1743316013, --BURRITO3
	893081117, --BURRITO4
	1132262048, --BURRITO5
	-713569950, --BUS
	788747387, --BUZZARD
	745926877, --BUZZARD2
	-960289747, --CABLECAR
	1147287684, --CADDY
	-537896628, --CADDY2
	-769147461, --CADDY3
	1876516712, --CAMPER
	2072687711, --CARBONIZZARE
	11251904, --CARBONRS
	-50547061, --CARGOBOB
	1621617168, --CARGOBOB2
	1394036463, --CARGOBOB3
	2025593404, --CARGOBOB4
	368211810, --CARGOPLANE
	941800958, --CASCO
	2006918058, --CAVALCADE
	-789894171, --CAVALCADE2
	-1311154784, --CHEETAH
	223240013, --CHEETAH2
	6774487, --CHIMERA
	349605904, --CHINO
	-1361687965, --CHINO2
	390201602, --CLIFFHANGER
	-2072933068, --COACH
	906642318, --COG55
	704435172, --COG552
	330661258, --COGCABRIO
	-2030171296, --COGNOSCENTI
	-604842630, --COGNOSCENTI2
	-1045541610, --COMET2
	-2022483795, --COMET3
	683047626, --CONTENDER
	108773431, --COQUETTE
	1011753235, --COQUETTE2
	784565758, --COQUETTE3
	448402357, --CRUISER
	321739290, --CRUSADER
	-644710429, --CUBAN800
	-1006919392, --CUTTER
	2006142190, --DAEMON
	-1404136503, --DAEMON2
	822018448, --DEFILER
	-239841468, --DIABLOUS
	1790834270, --DIABLOUS2
	-1130810103, --DILETTANTE
	1682114128, --DILETTANTE2
	1033245328, --DINGHY
	276773164, --DINGHY2
	509498602, --DINGHY3
	867467158, --DINGHY4
	1770332643, --DLOADER
	-2140210194, --DOCKTRAILER
	-884690486, --DOCKTUG
	-901163259, --DODO
	80636076, --DOMINATOR
	-915704871, --DOMINATOR2
	-1670998136, --DOUBLE
	1177543287, --DUBSTA
	-394074634, --DUBSTA2
	-1237253773, --DUBSTA3
	723973206, --DUKES
	-326143852, --DUKES2
	-2130482718, --DUMP
	-1661854193, --DUNE
	534258863, --DUNE2
	1897744184, --DUNE3
	-827162039, --DUNE4
	-312295511, --DUNE5
	970356638, --DUSTER
	196747873, --ELEGY
	-566387422, --ELEGY2
	-685276541, --EMPEROR
	-1883002148, --EMPEROR2
	-1241712818, --EMPEROR3
	1753414259, --ENDURO
	-1291952903, --ENTITYXF
	2035069708, --ESSKEY
	-5153954, --EXEMPLAR
	-591610296, --F620
	-2119578145, --FACTION
	-1790546981, --FACTION2
	-2039755226, --FACTION3
	-1842748181, --FAGGIO
	55628203, --FAGGIO2
	-1289178744, --FAGGIO3
	2134395284, --FAGGION
	1127131465, --FBI
	-1647941228, --FBI2
	627535535, --FCR
	-757735410, --FCR2
	-391594584, --FELON
	-89291282, --FELON2
	-1995326987, --FELTZER2
	-1566741232, --FELTZER3
	1938952078, --FIRETRUK
	-836512833, --FIXTER
	1353720154, --FLATBED
	1426219628, --FMJ
	1491375716, --FORKLIFT
	-1137532101, --FQ2
	1030400667, --FREIGHT
	184361638, --FREIGHTCAR
	920453016, --FREIGHTCONT1
	240201337, --FREIGHTCONT2
	642617954, --FREIGHTGRAIN
	-777275802, --FREIGHTTRAILER
	744705981, --FROGGER
	1949211328, --FROGGER2
	1909141499, --FUGITIVE
	-1089039904, --FUROREGT
	499169875, --FUSILADE
	2016857647, --FUTO
	741090084, --GARGOYLE
	-1800170043, --GAUNTLET
	349315417, --GAUNTLET2
	-1745203402, --GBURRITO
	296357396, --GBURRITO2
	75131841, --GLENDALE
	1234311532, --GP1
	1019737494, --GRAINTRAILER
	-1775728740, --GRANGER
	-1543762099, --GRESLEY
	-2107990196, --GUARDIAN
	884422927, --HABANERO
	1265391242, --HAKUCHOU
	-255678177, --HAKUCHOU2
	-32236122, --HALFTRACK
	444583674, --HANDLER
	1518533038, --HAULER
	387748548, --HAULER2
	301427732, --HEXER
	37348240, --HOTKNIFE
	486987393, --HUNTLEY
	970385471, --HYDRA
	418536135, --INFERNUS
	-1405937764, --INFERNUS2
	-1289722222, --INGOT
	-159126838, --INNOVATION
	-1860900134, --INSURGENT
	2071877360, --INSURGENT2
	-1924433270, --INSURGENT3
	886934177, --INTRUDER
	-1177863319, --ISSI2
	-2048333973, --ITALIGTB
	-482719877, --ITALIGTB2
	-624529134, --JACKAL
	1051415893, --JB700
	-1297672541, --JESTER
	-1106353882, --JESTER2
	1058115860, --JET
	861409633, --JETMAX
	-120287622, --JOURNEY
	92612664, --KALAHARI
	544021352, --KHAMELION
	-1372848492, --KURUMA
	410882957, --KURUMA2
	1269098716, --LANDSTALKER
	-1281684762, --LAZER
	-1232836011, --LE7B
	640818791, --LECTRO
	469291905, --LGUARD
	-114627507, --LIMO2
	2068293287, --LURCHER
	621481054, --LUXOR
	-1214293858, --LUXOR2
	482197771, --LYNX
	-1660945322, --MAMBA
	-1746576111, --MAMMATUS
	-2124201592, --MANANA
	-1523428744, --MANCHEZ
	-1043459709, --MARQUIS
	1233534620, --MARSHALL
	-142942670, --MASSACRO
	-631760477, --MASSACRO2
	-1660661558, --MAVERICK
	914654722, --MESA
	-748008636, --MESA2
	-2064372143, --MESA3
	868868440, --METROTRAIN
	165154707, --MILJET
	-310465116, --MINIVAN
	-1126264336, --MINIVAN2
	-784816453, --MIXER
	475220373, --MIXER2
	-433375717, --MONROE
	-845961253, --MONSTER
	525509695, --MOONBEAM
	1896491931, --MOONBEAM2
	1783355638, --MOWER
	904750859, --MULE
	-1050465301, --MULE2
	-2052737935, --MULE3
	-634879114, --NEMESIS
	1034187331, --NERO
	1093792632, --NERO2
	-1606187161, --NIGHTBLADE
	-1943285540, --NIGHTSHADE
	433954513, --NIGHTSHARK
	-1295027632, --NIMBUS
	1032823388, --NINEF
	-1461482751, --NINEF2
	-777172681, --OMNIS
	884483972, --OPPRESSOR
	1348744438, --ORACLE
	-511601230, --ORACLE2
	1987142870, --OSIRIS
	569305213, --PACKER
	-431692672, --PANTO
	1488164764, --PARADISE
	-808457413, --PATRIOT
	-2007026063, --PBUS
	-909201658, --PCJ
	-1758137366, --PENETRATOR
	-377465520, --PENUMBRA
	1830407356, --PEYOTE
	-1829802492, --PFISTER811
	-2137348917, --PHANTOM
	-1649536104, --PHANTOM2
	177270108, --PHANTOM3
	-2095439403, --PHOENIX
	1507916787, --PICADOR
	1078682497, --PIGALLE
	2046537925, --POLICE
	-1627000575, --POLICE2
	1912215274, --POLICE3
	-1973172295, --POLICE4
	-34623805, --POLICEB
	-1536924937, --POLICEOLD1
	-1779120616, --POLICEOLD2
	456714581, --POLICET
	353883353, --POLMAV
	-119658072, --PONY
	943752001, --PONY2
	2112052861, --POUNDER
	-1450650718, --PRAIRIE
	741586030, --PRANGER
	-488123221, --PREDATOR
	-1883869285, --PREMIER
	-1150599089, --PRIMO
	-2040426790, --PRIMO2
	356391690, --PROPTRAILER
	2123327359, --PROTOTIPO
	-1651067813, --RADI
	390902130, --RAKETRAILER
	-2103821244, --RALLYTRUCK
	1645267888, --RANCHERXL
	1933662059, --RANCHERXL2
	-1934452204, --RAPIDGT
	1737773231, --RAPIDGT2
	-674927303, --RAPTOR
	1873600305, --RATBIKE
	-667151410, --RATLOADER
	-589178377, --RATLOADER2
	234062309, --REAPER
	-1207771834, --REBEL
	-2045594037, --REBEL2
	-14495224, --REGINA
	-1098802077, --RENTALBUS
	841808271, --RHAPSODY
	782665360, --RHINO
	-1205689942, --RIOT
	-845979911, --RIPLEY
	2136773105, --ROCOTO
	627094268, --ROMERO
	-1705304628, --RUBBLE
	-893578776, --RUFFIAN
	-227741703, --RUINER
	941494461, --RUINER2
	777714999, --RUINER3
	1162065741, --RUMPO
	-1776615689, --RUMPO2
	1475773103, --RUMPO3
	719660200, --RUSTON
	-1685021548, --SABREGT
	223258115, --SABREGT2
	-599568815, --SADLER
	734217681, --SADLER2
	788045382, --SANCHEZ
	-1453280962, --SANCHEZ2
	1491277511, --SANCTUS
	-1189015600, --SANDKING
	989381445, --SANDKING2
	-82626025, --SAVAGE
	-1255452397, --SCHAFTER2
	-1485523546, --SCHAFTER3
	1489967196, --SCHAFTER4
	-888242983, --SCHAFTER5
	1922255844, --SCHAFTER6
	-746882698, --SCHWARZER
	-186537451, --SCORCHER
	-1700801569, --SCRAP
	-1030275036, --SEASHARK
	-616331036, --SEASHARK2
	-311022263, --SEASHARK3
	1221512915, --SEMINOLE
	1349725314, --SENTINEL
	873639469, --SENTINEL2
	1337041428, --SERRANO
	-1757836725, --SEVEN70
	-1214505995, --SHAMAL
	819197656, --SHEAVA
	-1683328900, --SHERIFF
	1922257928, --SHERIFF2
	-405626514, --SHOTARO
	1044954915, --SKYLIFT
	729783779, --SLAMVAN
	833469436, --SLAMVAN2
	1119641113, --SLAMVAN3
	743478836, --SOVEREIGN
	1886268224, --SPECTER
	1074745671, --SPECTER2
	231083307, --SPEEDER
	437538602, --SPEEDER2
	-810318068, --SPEEDO
	728614474, --SPEEDO2
	400514754, --SQUALO
	1923400478, --STALION
	-401643538, --STALION2
	-1477580979, --STANIER
	1545842587, --STINGER
	-2098947590, --STINGERGT
	1747439474, --STOCKADE
	-214455498, --STOCKADE3
	1723137093, --STRATUM
	-1961627517, --STRETCH
	-2122757008, --STUNT
	771711535, --SUBMERSIBLE
	-1066334226, --SUBMERSIBLE2
	970598228, --SULTAN
	-295689028, --SULTANRS
	-282946103, --SUNTRAP
	1123216662, --SUPERD
	710198397, --SUPERVOLITO
	-1671539132, --SUPERVOLITO2
	384071873, --SURANO
	699456151, --SURFER
	-1311240698, --SURFER2
	-1894894188, --SURGE
	-339587598, --SWIFT
	1075432268, --SWIFT2
	1663218586, --T20
	1951180813, --TACO
	-1008861746, --TAILGATER
	972671128, --TAMPA
	-1071380347, --TAMPA2
	-1210451983, --TAMPA3
	-730904777, --TANKER
	1956216962, --TANKER2
	586013744, --TANKERCAR
	-956048545, --TAXI
	-2096818938, --TECHNICAL
	1180875963, --TECHNICAL2
	1356124575, --TECHNICAL3
	272929391, --TEMPESTA
	1836027715, --THRUST
	48339065, --TIPTRUCK
	-947761570, --TIPTRUCK2
	1981688531, --TITAN
	1504306544, --TORERO
	464687292, --TORNADO
	1531094468, --TORNADO2
	1762279763, --TORNADO3
	-2033222435, --TORNADO4
	-1797613329, --TORNADO5
	-1558399629, --TORNADO6
	1070967343, --TORO
	908897389, --TORO2
	1941029835, --TOURBUS
	-1323100960, --TOWTRUCK
	-442313018, --TOWTRUCK2
	2078290630, --TR2
	1784254509, --TR3
	2091594960, --TR4
	1641462412, --TRACTOR
	-2076478498, --TRACTOR2
	1445631933, --TRACTOR3
	1502869817, --TRAILERLARGE
	2016027501, --TRAILERLOGS
	-877478386, --TRAILERS
	-1579533167, --TRAILERS2
	-2058878099, --TRAILERS3
	-1100548694, --TRAILERS4
	712162987, --TRAILERSMALL
	-1881846085, --TRAILERSMALL2
	1917016601, --TRASH
	-1255698084, --TRASH2
	-1352468814, --TRFLAT
	1127861609, --TRIBIKE
	-1233807380, --TRIBIKE2
	-400295096, --TRIBIKE3
	101905590, --TROPHYTRUCK
	-663299102, --TROPHYTRUCK2
	290013743, --TROPIC
	1448677353, --TROPIC2
	1887331236, --TROPOS
	-2100640717, --TUG
	-982130927, --TURISMO2
	408192225, --TURISMOR
	-1770643266, --TVTRAILER
	2067820283, --TYRUS
	516990260, --UTILLITRUCK
	887537515, --UTILLITRUCK2
	2132890591, --UTILLITRUCK3
	338562499, --VACCA
	-140902153, --VADER
	1939284556, --VAGNER
	-1600252419, --VALKYRIE
	1543134283, --VALKYRIE2
	-1673356438, --VELUM
	1077420264, --VELUM2
	1102544804, --VERLIERER2
	1341619767, --VESTRA
	-825837129, --VIGERO
	-1353081087, --VINDICATOR
	-498054846, --VIRGO
	-899509638, --VIRGO2
	16646064, --VIRGO3
	-1845487887, --VOLATUS
	-1622444098, --VOLTIC
	989294410, --VOLTIC2
	2006667053, --VOODOO
	523724515, --VOODOO2
	-609625092, --VORTEX
	1373123368, --WARRENER
	1777363799, --WASHINGTON
	-1912017790, --WASTELANDER
	1581459400, --WINDSOR
	-1930048799, --WINDSOR2
	-618617997, --WOLFSBANE
	917809321, --XA21
	1203490606, --XLS
	-432008408, --XLS2
	65402552, --YOUGA
	1026149675, --YOUGA2
	-1403128555, --ZENTORNO
	-1122289213, --ZION
	-1193103848, --ZION2
	-1009268949, --ZOMBIEA
	-570033273, --ZOMBIEB
	758895617 --ZTYPE
}				


blacklistedmodel = 
{
	970598228, --SULTAN
	-1485523546, --SCHAFTER3
	223258115, --SABREGT2
	-591610296, --F620
	1349725314, --SENTINEL
	-1829802492, --PFISTER811
	2016857647, --FUTO
	-1757836725, --SEVEN70
	-1041692462, --BANSHEE
	1119641113, --SLAMVAN3
	
	--Voiture buggé lente
	633712403, --BANSHEE2
}

classmdl = {
	[0] = { classmodel = "Compacts", 		Multiplicateur = 5, BlacklistedMultiplicateur = 8},
	[1] = { classmodel = "Sedans", 			Multiplicateur = 5, BlacklistedMultiplicateur = 8},
	[2] = { classmodel = "SUVs", 			Multiplicateur = 5, BlacklistedMultiplicateur = 8},
	[3] = { classmodel = "Coupes", 			Multiplicateur = 5, BlacklistedMultiplicateur = 8},
	[4] = { classmodel = "Muscle", 			Multiplicateur = 5, BlacklistedMultiplicateur = 8},
	[5] = { classmodel = "SportsClassics", 	Multiplicateur = 5, BlacklistedMultiplicateur = 8},
	[6] = { classmodel = "Sports", 			Multiplicateur = 5, BlacklistedMultiplicateur = 10},
	[7] = { classmodel = "Supercar", 		Multiplicateur = 3.0, BlacklistedMultiplicateur = 6.5},
	[8] = { classmodel = "Motorcycles", 	Multiplicateur = 5, BlacklistedMultiplicateur = 8},
	[9] = { classmodel = "Off-road", 		Multiplicateur = 5, BlacklistedMultiplicateur = 8},
	[10] = { classmodel = "Industrial", 	Multiplicateur = 5, BlacklistedMultiplicateur = 8},
	[11] = { classmodel = "Utility", 		Multiplicateur = 5, BlacklistedMultiplicateur = 8},
	[12] = { classmodel = "Vans", 			Multiplicateur = 5, BlacklistedMultiplicateur = 8},
	[13] = { classmodel = "Cycles", 		Multiplicateur = 5, BlacklistedMultiplicateur = 8},
	[14] = { classmodel = "Boats", 			Multiplicateur = 5, BlacklistedMultiplicateur = 8},
	[15] = { classmodel = "Helicopters", 	Multiplicateur = 5, BlacklistedMultiplicateur = 8},
	[16] = { classmodel = "Planes", 		Multiplicateur = 5, BlacklistedMultiplicateur = 8},
	[17] = { classmodel = "Service", 		Multiplicateur = 5, BlacklistedMultiplicateur = 8},
	[18] = { classmodel = "Emergency", 		Multiplicateur = 2.4, BlacklistedMultiplicateur = 8},
	[19] = { classmodel = "Military", 		Multiplicateur = 5, BlacklistedMultiplicateur = 8},
	[20] = { classmodel = "Commercial", 	Multiplicateur = 5, BlacklistedMultiplicateur = 8},
	[21] = { classmodel = "Trains", 		Multiplicateur = 5, BlacklistedMultiplicateur = 8},
}

local PersonnalCar = {}

local garages_nbMecanoInService = 0
local garages_nbMecanoDispo = 0
local ignore_meca = 0
local firstcheck = 0
local ownerconfirmed = true

function msginf(msg, duree)
    duree = duree or 500
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(msg)
    DrawSubtitleTimed(duree, 1)
end

function GetBlacklistedList()
	return blacklistedmodel
end

function GetBalancedList()
	return listedcar
end

function GetBalancedCatList()
	return classmdl
end

AddEventHandler('onClientMapStart', function()
    TriggerServerEvent('garages:storeallvehicles')
end)

RegisterNetEvent('garages:addvhltothelist')
AddEventHandler('garages:addvhltothelist', function(vhl)
    local toadd = { key= vhl.name, model=vhl.model, state= vhl.state, plate= vhl.plate }
    SendNUIMessage({addlist = json.encode(toadd)})
end)

RegisterNetEvent('garages:addvhltothelistForFix')
AddEventHandler('garages:addvhltothelistForFix', function(vhl)
    local toadd = { key= vhl.name, model=vhl.model, state= vhl.state, plate= vhl.plate }
	table.insert(PersonnalCar, toadd) 
end)

function openGui(spawnable)
    SetNuiFocus(true)
    SendNUIMessage({ openUI = true })
    SendNUIMessage({ spawnable = json.encode({spawnable = spawnable}) })
end
function closeGui()
    SetNuiFocus(false)
    SendNUIMessage({ closeUI = true })
    currentUiState = false
end

-------------------------------------------------- NUI LISTENER --------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback('close', function(data, cb)
    closeGui()
    cb('ok')
end)

RegisterNetEvent('veh_shop:closeGui')
AddEventHandler('veh_shop:closeGui', function()
    closeGui()
end)

RegisterNUICallback('fourriere', function(data, cb)
    TriggerServerEvent('garages:settofourriere', {model= data.model, plate= data.plate})
    cb('ok')
end)

local antiSpamActivated = false
RegisterNUICallback('init', function(data, cb)
	TriggerServerEvent('garages:getplayervehicle', data.spawnable)
	cb('ok')
end)

function checkIfZoneIsClear()
    local car = GetClosestVehicle(currentspawnzone.x,currentspawnzone.y,currentspawnzone.z, 5.000, 0, 70)
    local heli = GetClosestVehicle(currentspawnzone.x,currentspawnzone.y,currentspawnzone.z, 5.000, 0, 16384)
    local boat = GetClosestVehicle(currentspawnzone.x,currentspawnzone.y,currentspawnzone.z, 5.000, 0, 12294)
    local plane = GetClosestVehicle(currentspawnzone.x,currentspawnzone.y,currentspawnzone.z, 15.000, 0, 16386)
    if DoesEntityExist(car) or DoesEntityExist(heli) or DoesEntityExist(boat) or DoesEntityExist(plane)then
        return false
    else
        return true
    end
end

RegisterNUICallback('spawn', function(data, cb)
    if not checkIfZoneIsClear() then
        drawNotification("La zone est ~r~encombrée~r~")
        closeGui()
    else
        if data.state == 0 then
            TriggerServerEvent('garages:getvehicle', {model = data.model, plate = data.plate })

        elseif data.state == 1 then
            drawNotification("Votre véhicule est déjà sortis")
            closeGui()
        else
            drawNotification("Votre véhicule est à la fourrière")
        end
    end
    cb('ok')
end)

RegisterNetEvent('garages:GetPersonnelMeca')
AddEventHandler('garages:GetPersonnelMeca',function(nbPersonnel, nbDispo)
    garages_nbMecanoInService = nbPersonnel
    garages_nbMecanoDispo = nbDispo
end)

RegisterNetEvent('garages:verifowner')
AddEventHandler('garages:verifowner', function(data)
	ownerconfirmed = data
end)

RegisterNetEvent('garages:EnterResult')
AddEventHandler('garages:EnterResult',function(statut)
    Paid = statut
end)

RegisterNetEvent('garages:store')
AddEventHandler('garages:store', function()
    local current = GetVehiclePedIsIn(GetPlayerPed(-1), false)
	local engineHealth = GetVehicleEngineHealth(current)
	local vehicleHealth = GetEntityHealth(current)
	ownerconfirmed = false
	firstcheck = 0
		
    lastvhl = current
    if current == 0 then
        drawNotification("Vous devez etre dans un vehicule !")
    else
		if GetPedInVehicleSeat(current, -1) == GetPlayerPed(-1) then
			local model = GetEntityModel(current)
			local plate = GetVehicleNumberPlateText(current)
			
			if firstcheck == 0 then
				TriggerServerEvent('garages:storevehiculeForFix', {model = tostring(model), plate = plate })
				firstcheck = 1
				Wait(500)
			end
		
			if ownerconfirmed then
				if vehicleHealth >= 950 then
					TaskLeaveVehicle(GetPlayerPed(-1), current, 4160)
					Wait(500)
					TriggerServerEvent('garages:storevehicule', {model = tostring(model), plate = plate })

					local indexToRemove = 0
					local newPlate = string.gsub(plate, "%s+", "")

					local otherPlate = ""
					for k,v in pairs(vehiclesOut) do
						otherPlate = string.gsub(v.plate, "%s+", "")
						if tostring(model) == v.model and newPlate == otherPlate then
							indexToRemove = k
						end
					end

					if indexToRemove ~= 0 then
						table.remove(vehiclesOut, indexToRemove)
					end

					ignore_meca = 0
					firstcheck = 0
					ownerconfirmed = false
				else
					drawNotification("Le vehicule est trop endommage ! appel un mecano ou va t'acheter un kit au Los Santos Customs")
				end
			
			elseif firstcheck == 1 and not ownerconfirmed then
				drawNotification("Tu veux que j'appele les flics ? Ce n'est pas ton véhicule ! ")
			end
		else
			drawNotification("Vous devez etre conducteur, petit malin...")
		end
    end
end)

RegisterNUICallback('store', function(data, cb)
    TriggerEvent('garages:store')
    cb('ok')
end)

RegisterNetEvent('garages:vehiculestored')
AddEventHandler('garages:vehiculestored', function(vhl)
    local current =  GetPlayersLastVehicle(GetPlayerPed(-1), true)
    SetEntityAsMissionEntity(current, true, true)
    Wait(300)
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(current))
    Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(current))
    drawNotification("Véhicule: ~g~rentré~g~")
    closeGui()
end)

RegisterNetEvent('garages:notifs')
AddEventHandler('garages:notifs', function(notif)
    drawNotification(notif)
end)

RegisterNetEvent('garages:close')
AddEventHandler('garages:close', function()
    closeGui()
end)

RegisterNetEvent('garages:spawnvehicle')
AddEventHandler('garages:spawnvehicle', function(vhl)
	closeGui()

	local isVehicleAlreadyOut = false
	for k,v in pairs(vehiclesOut) do
		if vhl.model == v.model and vhl.plate == v.plate then
			isVehicleAlreadyOut = true
		end
	end

	if not isVehicleAlreadyOut then
		local newVehicle = {model = vhl.model, plate = vhl.plate, isOut = true}
		table.insert(vehiclesOut, newVehicle)

		local customs = json.decode(vhl.customs)
		local myPed = GetPlayerPed(-1)
		Wait(100)
		if checkIfZoneIsClear() then
			local car = tonumber(vhl.model)
			RequestModel(car)
			while not HasModelLoaded(car) do
				Citizen.Wait(0)
			end
			local veh = CreateVehicle(car, currentspawnzone.x,currentspawnzone.y,currentspawnzone.z, 0.0, true, false)
			DecorRegister("Arcadia", 2)
			DecorSetBool(veh, "Arcadia", true)

			SetModelAsNoLongerNeeded(car)

			SetEntityHeading(veh, currentspawnzone.h)
			SetVehicleNumberPlateText(veh, vhl.plate)
			SetVehicleOnGroundProperly(veh)
			SetPedIntoVehicle(myPed, veh, -1)
			SetVehicleHasBeenOwnedByPlayer(veh,true)
			SetEntityAsMissionEntity(veh, true, true)
			local id = NetworkGetNetworkIdFromEntity(veh)
			SetNetworkIdCanMigrate(id, true)
			SetEntityInvincible(veh, false)
			-- Set mod kit to 0 allow modification
			SetVehicleModKit(veh, 0 )
			-- Set color Primary
			if customs.color ~= nil then
				SetVehicleModColor_1(veh, customs.color.primary.type, 0,0)
			end

			SetVehicleCustomPrimaryColour(veh, customs.color.primary.red,  customs.color.primary.green,  customs.color.primary.blue)
			-- Set color Secondary
			SetVehicleModColor_2(veh, customs.color.secondary.type, 0,0)
			SetVehicleCustomSecondaryColour(veh, customs.color.secondary.red,  customs.color.secondary.green,  customs.color.secondary.blue)
			-- Set perlescent
			SetVehicleExtraColours(veh, customs.color.pearlescent, customs.wheels.color)
			-- Set mods in db
			--if customs.mods.size > 0 then
				ToggleVehicleMod(veh, 18, false)
				for i = 0, 49 do
					if i ~= 11 and i ~= 12 and i ~= 13 and i ~= 15 and i ~= 18 then
						SetVehicleMod(veh, i, -1, false)
					else
						SetVehicleMod(veh, i, 0, false)
					end
					if customs.mods[""..i..""] ~= nil then            
						SetVehicleMod(veh, i, customs.mods[""..i..""], false)
						if i == 11 then
							--SetVehicleEnginePowerMultiplier(veh, GetVehicleModModifierValue(veh, i, customs.mods[""..i..""])/5 + 0.1)
						end                 
					end
					if i == 18 and customs.mods[""..i..""] == false then
						ToggleVehicleMod(veh, 18, false)
					elseif i == 18 and customs.mods[""..i..""] == 1 then
						ToggleVehicleMod(veh, 18, true)
					end
				end
			--end
        
			SetVehicleMod(veh, 15, customs.mods["15"], false)
			if vhl.type == 1 then
				-- Set neons
				if customs.neons.enabled then
					SetVehicleNeonLightEnabled(veh, 0, customs.neons.enabled)
					SetVehicleNeonLightEnabled(veh, 1, customs.neons.enabled)
					SetVehicleNeonLightEnabled(veh, 2, customs.neons.enabled)
					SetVehicleNeonLightEnabled(veh, 3, customs.neons.enabled)
					SetVehicleNeonLightsColour(veh, customs.neons.red, customs.neons.green, customs.neons.blue)
				end
				-- Set windows
				SetVehicleWindowTint(veh, customs.windows)
				-- Set Jantes
				SetVehicleWheelType(veh, tonumber(customs.wheels.type))
				SetVehicleMod(veh, 23, tonumber(customs.wheels.choice), false)
				SetVehicleMod(veh, 24, tonumber(customs.wheels.choice), false)
				-- Set Tyreburst
				if  customs.tyreburst.enabled then
					ToggleVehicleMod(veh, 20, true)
					SetVehicleTyreSmokeColor(veh, customs.tyreburst.red, customs.tyreburst.green, customs.tyreburst.blue)
				end
				if customs.xenons == 1 then
					ToggleVehicleMod(veh, 22, true)
				else
					ToggleVehicleMod(veh, 22, false)
				end
				if customs.horn ~= nil then
					SetVehicleMod(veh, 14, customs.horn)
				end
			end
			-- Respray the veh
			SetVehicleDirtLevel(veh)

			-- modif tdlc
			Citizen.Wait(200)
			local debugvar = false
			local var87 = 10000
			local VehClassModel = GetVehicleClass(veh) 
			local entitymdl = GetEntityModel(veh)
			local Model = GetDisplayNameFromVehicleModel(entitymdl)

			if debugvar == true then msginf("NEW CATEGORIE : " .. VehClassModel .. " " .. Model .. " Entity mdl : " .. entitymdl,10000) end
			for k, v in pairs(listedcar) do
				if not IsVehicleModel(veh, v) then
					table.insert(listedcar, entitymdl)
				end
			end

			for k, v in pairs(listedcar) do
				if IsVehicleModel(veh, v) then
					for j, l in pairs(classmdl) do
						local GetClassModel = GetVehicleClass(veh) 
						local Model = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
						ResultatClassmodel = j
						if GetVehicleClass(veh) == j then
							resultatcalcul = GetVehicleModModifierValue(veh, 11, GetVehicleMod(veh,11))/l.Multiplicateur + 0.1
							SetVehicleEnginePowerMultiplier(veh, resultatcalcul)
							globalclassmodelforblacklist = l.classmodel
							blacklistedmultip = l.BlacklistedMultiplicateur
							if debugvar == true then msginf("CATEGORIE : " .. l.classmodel .. " " .. Model .. " V : " .. l.Multiplicateur .. " result : " .. resultatcalcul .. " Vehicule n°: " .. k ,10000) end
							if k == 1080 and debugvar == true then msginf("Voiture non CATEGORISÉ : " .. l.classmodel .. " " .. Model .. " V : " .. l.Multiplicateur .. " Multipl : " .. resultatcalcul .. " Vehicule n°: " .. k ,10000) end -- end  debugvar == true
							break
						else
							if debugvar == true then msginf("BUG: " .. GetClassModel .. " V : " .. v .. " J : " .. ResultatClassmodel .. " l : " .. l.classmodel ,10000) end
						end
					end
				end
			end

			for k2, v2 in pairs(blacklistedmodel) do
				if IsVehicleModel(veh, v2) then
					--Voiture buggé reelement au cas par cas:
					if IsVehicleModel(veh, blacklistedmodel[6]) then -- PFISTER811
						resultatcalcul = GetVehicleModModifierValue(veh, 11, GetVehicleMod(veh,11))/8.5 + 0.1
						SetVehicleEnginePowerMultiplier(veh, resultatcalcul)
					elseif IsVehicleModel(veh, blacklistedmodel[2]) then -- SCHAFTERV12
						resultatcalcul = GetVehicleModModifierValue(veh, 11, GetVehicleMod(veh,11))/13.5 + 0.1
						SetVehicleEnginePowerMultiplier(veh, resultatcalcul)
					elseif IsVehicleModel(veh, blacklistedmodel[10]) then -- SLAMVAN3
						resultatcalcul = GetVehicleModModifierValue(veh, 11, GetVehicleMod(veh,11))/23.5 + 0.1 -- 22.5 = 250 km/h |  23.5 = 180 km/h ...
						SetVehicleEnginePowerMultiplier(veh, resultatcalcul)
					elseif IsVehicleModel(veh, blacklistedmodel[11]) then -- BANSHEE2
						resultatcalcul = GetVehicleModModifierValue(veh, 11, GetVehicleMod(veh,11))/2.5 + 0.01
						SetVehicleEnginePowerMultiplier(veh, resultatcalcul)
					else
						SetVehicleEnginePowerMultiplier(veh, GetVehicleModModifierValue(veh, 11, GetVehicleMod(veh,11))/blacklistedmultip + 0.1)
						resultatcalcul = math.ceil((GetVehicleMod(veh,11)/blacklistedmultip + 0.1)*var87)/var87
					end
					if debugvar == true then msginf("~r~NERF CATEGORIE : ~w~" .. globalclassmodelforblacklist .. " ~r~Diviser : " .. blacklistedmultip .. " Multiplicateur : " .. resultatcalcul,10000) end
					break
				end
			end	
		else
			drawNotification("Véhicule ~r~dans la zone ~r~")
		end
	else
		drawNotification("Votre véhicule est déjà sortis, bien essayé")
	end
end)

function DrawMarkers(x,y,z,markerWidth, markerColorRed, markerColorGreen, markerColorBlue, markerAlpha)
	DrawMarker(27, x, y, z + 0.05, 0, 0, 0, 0, 0, 0, markerWidth, markerWidth, 1.0, 66, 152, 249, 50, 0, 0, 2, 0, 0, 0, 0)
    --DrawMarker(1, x, y, z, 0, 0, 0, 0, 0, 0, markerWidth,  markerWidth,0.101, markerColorRed, markerColorGreen, markerColorBlue,markerAlpha, 0,1,0, 0, 0, 0,0)
end

function setMapMarkers(locations)
    for k,v in ipairs(locations)do
		if not v.hidden then
			local blip = AddBlipForCoord(v.x, v.y, v.z)
			SetBlipSprite(blip, v.markerType)
			SetBlipColour(blip, v.markerColor)
			SetBlipScale(blip, 0.8)
			SetBlipAsShortRange(blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(v.name)
			EndTextCommandSetBlipName(blip)
		end
    end
end

function drawNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

Citizen.CreateThread(function()
    setMapMarkers(locations)
    while true do
        Citizen.Wait(0)
        local pos = GetEntityCoords(GetPlayerPed(-1), false)
        -- local hotdog = GetHashKey('prop_weed_01')
        -- local stand = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0001, hotdog, false, false, false)
        -- z--Citizen.Trace(stand)
        for _,d in ipairs( locations )do
            if Vdist(d.x, d.y, d.z, pos.x, pos.y, pos.z) < 15.0 then
                DrawMarkers(d.x, d.y, d.z, d.markerWidth, 255, 255, 0, 100)
                DrawMarkers(d.spawn_x, d.spawn_y, d.spawn_z, 6.001, 255, 0, 0, 100)
            end
            if(Vdist(d.x, d.y, d.z, pos.x, pos.y, pos.z) < d.activationDist ) then
                SetTextComponentFormat("STRING")
                AddTextComponentString(" ~INPUT_CONTEXT~ pour acceder à votre garage.")
                DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            end
            if(IsControlJustReleased(1, 38) and Vdist(d.x, d.y, d.z, pos.x, pos.y, pos.z) <  d.activationDist ) then
                if currentUiState == false then
				Citizen.Wait(100)
                    openGui(d.spawnable)
                    currentspawnzone = {
                        x = d.spawn_x,
                        y = d.spawn_y,
                        z= d.spawn_z,
						h= d.heading,
                    }
					currentUiState = true

					Citizen.Wait(1000)
                else
                    closeGui()
                    currentUiState = false
                end
            end
        end
		for _,d in ipairs( locations1 )do
            if Vdist(d.x, d.y, d.z, pos.x, pos.y, pos.z) < 15.0 then
                DrawMarkers(d.x, d.y, d.z, d.markerWidth, 255, 255, 0, 100)
                DrawMarkers(d.spawn_x, d.spawn_y, d.spawn_z, 6.001, 255, 0, 0, 100)
            end
            if(Vdist(d.x, d.y, d.z, pos.x, pos.y, pos.z) < d.activationDist ) then
                SetTextComponentFormat("STRING")
                AddTextComponentString(" ~INPUT_CONTEXT~ pour acceder à votre garage.")
                DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            end
            if(IsControlJustReleased(1, 38) and Vdist(d.x, d.y, d.z, pos.x, pos.y, pos.z) <  d.activationDist ) then
                if currentUiState == false then
				Citizen.Wait(100)
                    openGui(d.spawnable)
                    currentspawnzone = {
                        x = d.spawn_x,
                        y = d.spawn_y,
                        z= d.spawn_z,
						h= d.heading,
                    }
                    Citizen.Wait(100)
					currentUiState = true
                else
                    closeGui()
                    currentUiState = false
                end
            end
        end

    end
end)
