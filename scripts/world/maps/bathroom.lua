return {
  version = "1.9",
  luaversion = "5.1",
  tiledversion = "1.9.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 11,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 5,
  nextobjectid = 14,
  properties = {
    ["border"] = "leaves",
    ["light"] = "true",
    ["name"] = "Bathroom"
  },
  tilesets = {
    {
      name = "toriel_house",
      firstgid = 1,
      filename = "../tilesets/toriel_house.tsx",
      exportfilename = "../tilesets/toriel_house.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 11,
      height = 12,
      id = 1,
      name = "tiles",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1361, 1362, 1363, 1364, 1365, 1366, 1367, 1368, 1369, 1370, 1371,
        1395, 1396, 1397, 1398, 1399, 1400, 1401, 1402, 1403, 1404, 1405,
        1429, 1430, 1431, 1432, 1433, 1434, 1435, 1436, 1437, 1438, 1439,
        1463, 1464, 1465, 1466, 1467, 1468, 1469, 1470, 1471, 1472, 1473,
        1497, 1498, 1499, 1500, 1501, 1502, 1503, 1504, 1505, 1506, 1507,
        1531, 1532, 1533, 1534, 1535, 1536, 1537, 1538, 1539, 1540, 1541,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "collision",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          class = "",
          shape = "rectangle",
          x = 0,
          y = 80,
          width = 440,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          class = "",
          shape = "rectangle",
          x = 0,
          y = 342,
          width = 440,
          height = 39,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          class = "",
          shape = "polygon",
          x = 435,
          y = 334,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -17, y = -17 },
            { x = -16, y = -109 },
            { x = -47, y = -141 },
            { x = -48, y = -49 },
            { x = -75, y = -75 },
            { x = -75, y = -213 },
            { x = 5, y = -211 }
          },
          properties = {}
        },
        {
          id = 5,
          name = "",
          class = "",
          shape = "polygon",
          x = 0,
          y = 337,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 79, y = -79 },
            { x = 79, y = -215 },
            { x = 0, y = -217 }
          },
          properties = {}
        },
        {
          id = 7,
          name = "",
          class = "",
          shape = "rectangle",
          x = 240,
          y = 200,
          width = 120,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          class = "",
          shape = "rectangle",
          x = 40,
          y = 240,
          width = 200,
          height = 50.5,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "objects",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 9,
          name = "transition",
          class = "",
          shape = "rectangle",
          x = 393,
          y = 193,
          width = 36,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["facing"] = "right",
            ["map"] = "toriel_floor1",
            ["marker"] = "entry3"
          }
        },
        {
          id = 13,
          name = "script",
          class = "",
          shape = "rectangle",
          x = 392.858,
          y = 179.824,
          width = 80.7273,
          height = 133.318,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "sound_transition.dooropen",
            ["once"] = false
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "markers",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 10,
          name = "entry",
          class = "",
          shape = "point",
          x = 360,
          y = 320,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "spawn",
          class = "",
          shape = "point",
          x = 199.973,
          y = 321.327,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
