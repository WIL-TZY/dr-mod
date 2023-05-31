return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.8.4",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 27,
  height = 14,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 12,
  nextobjectid = 100,
  properties = {},
  tilesets = {
    {
      name = "alley_animated",
      firstgid = 1,
      filename = "../tilesets/alley_animated.tsx"
    },
    {
      name = "alley",
      firstgid = 37,
      filename = "../tilesets/alley.tsx"
    },
    {
      name = "city_alley",
      firstgid = 398,
      filename = "../tilesets/city_alley.tsx"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 27,
      height = 14,
      id = 1,
      name = "Tile Layer 1",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        296, 296, 296, 296, 296, 296, 296, 297, 296, 296, 296, 296, 296, 296, 296, 296, 296, 296, 296, 296, 296, 296, 296, 296, 296, 295, 296,
        296, 296, 296, 296, 296, 296, 296, 297, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 295, 296,
        296, 296, 296, 296, 296, 296, 296, 297, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 295, 296,
        326, 326, 326, 326, 326, 326, 326, 327, 341, 341, 341, 341, 341, 341, 341, 341, 341, 341, 341, 341, 341, 341, 341, 341, 341, 295, 296,
        326, 326, 326, 326, 326, 326, 326, 327, 446, 446, 446, 446, 446, 446, 446, 446, 446, 446, 446, 446, 446, 446, 446, 446, 447, 295, 296,
        341, 341, 341, 341, 341, 341, 341, 342, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 458, 295, 296,
        450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 458, 295, 296,
        450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 495, 468, 468, 493, 450, 450, 450, 450, 458, 295, 296,
        281, 281, 281, 281, 281, 281, 281, 282, 468, 481, 450, 450, 450, 450, 450, 450, 458, 122, 122, 456, 450, 450, 450, 450, 458, 295, 296,
        296, 296, 296, 296, 296, 296, 296, 297, 122, 456, 450, 450, 450, 450, 485, 468, 469, 122, 122, 456, 450, 450, 450, 450, 458, 295, 296,
        296, 296, 296, 296, 296, 296, 296, 297, 122, 456, 450, 450, 450, 450, 463, 446, 446, 446, 446, 449, 450, 450, 450, 450, 458, 295, 296,
        296, 296, 296, 296, 296, 296, 296, 297, 122, 456, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 450, 458, 295, 296,
        296, 296, 296, 296, 296, 296, 296, 297, 281, 281, 281, 281, 281, 281, 281, 281, 281, 281, 281, 281, 281, 281, 281, 281, 281, 295, 296,
        296, 296, 296, 296, 296, 296, 296, 297, 296, 296, 296, 296, 296, 296, 296, 296, 296, 296, 296, 296, 296, 296, 296, 296, 296, 295, 296
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "collision",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 200,
          width = 320,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 160,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 120,
          width = 680,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1000,
          y = 160,
          width = 40,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 480,
          width = 680,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 320,
          width = 320,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 360,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
      name = "blockcollision",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 91,
          name = "",
          type = "",
          shape = "polyline",
          x = 640,
          y = 280,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 0, y = 80 },
            { x = -80, y = 80 },
            { x = -80, y = 160 },
            { x = 160, y = 160 },
            { x = 160, y = 0 },
            { x = 0, y = 0 }
          },
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 10,
      name = "objects_buttons",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 95,
          name = "tilebutton",
          type = "",
          shape = "rectangle",
          x = 680,
          y = 280,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["blocks"] = true,
            ["cutscene"] = "alley3.puzzle_fail",
            ["group"] = "buton",
            ["once"] = true
          }
        },
        {
          id = 96,
          name = "tilebutton",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["blocks"] = true,
            ["cutscene"] = "alley3.puzzle_fail",
            ["group"] = "buton",
            ["once"] = true
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "markers",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 2,
          name = "entry_left",
          type = "",
          shape = "point",
          x = 40,
          y = 280,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "spawn",
          type = "",
          shape = "point",
          x = 360,
          y = 280,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "objects",
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
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 120,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "testing.image"
          }
        },
        {
          id = 4,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = -40,
          y = 240,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "alley2",
            ["marker"] = "entry_right"
          }
        },
        {
          id = 14,
          name = "forcefield",
          type = "",
          shape = "rectangle",
          x = 200,
          y = 200,
          width = 40,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {
            ["flag"] = "alley3_enable_forcefield"
          }
        },
        {
          id = 26,
          name = "setflag",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 160,
          width = 40,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {
            ["flag"] = "alley3_enable_forcefield",
            ["once"] = true
          }
        },
        {
          id = 27,
          name = "npc",
          type = "",
          shape = "point",
          x = 400,
          y = 240,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "starwalker",
            ["cutscene"] = "alley3.starwalker_disable"
          }
        },
        {
          id = 29,
          name = "setflag",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 240,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["flag"] = "alley3_seen_forcefield",
            ["once"] = true
          }
        },
        {
          id = 30,
          name = "setflag",
          type = "",
          shape = "rectangle",
          x = 840,
          y = 160,
          width = 40,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {
            ["flag"] = "alley3_enable_starwalker",
            ["once"] = true
          }
        },
        {
          id = 72,
          name = "pushblock",
          type = "",
          shape = "rectangle",
          x = 600,
          y = 360,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 90,
          name = "pushblock",
          type = "",
          shape = "rectangle",
          x = 720,
          y = 320,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 99,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 480,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["setflag"] = "clippy"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "controllers",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 28,
          name = "toggle",
          type = "",
          shape = "point",
          x = 320,
          y = 240,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["flag"] = "alley3_enable_forcefield",
            ["target"] = { id = 29 }
          }
        },
        {
          id = 32,
          name = "toggle",
          type = "",
          shape = "point",
          x = 800,
          y = 240,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["flag"] = "alley3_seen_forcefield",
            ["target"] = { id = 30 }
          }
        },
        {
          id = 33,
          name = "toggle",
          type = "",
          shape = "point",
          x = 460,
          y = 180,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["flag"] = "alley3_enable_starwalker",
            ["target"] = { id = 27 }
          }
        },
        {
          id = 98,
          name = "toggle",
          type = "",
          shape = "point",
          x = 240,
          y = 400,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["flag"] = "!clippy",
            ["target"] = { id = 13 }
          }
        }
      }
    }
  }
}
