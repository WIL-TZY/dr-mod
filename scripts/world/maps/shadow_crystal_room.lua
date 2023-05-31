return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.1",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 9,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 5,
  nextobjectid = 10,
  properties = {
    ["music"] = "castletown_empty",
    ["name"] = "???"
  },
  tilesets = {
    {
      name = "bg_dw_castle_town",
      firstgid = 1,
      filename = "../tilesets/bg_dw_castle_town.tsx",
      exportfilename = "../tilesets/bg_dw_castle_town.lua"
    },
    {
      name = "shadow_crystal_room",
      firstgid = 793,
      filename = "../tilesets/shadow_crystal_room.tsx",
      exportfilename = "../tilesets/shadow_crystal_room.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 9,
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
        0, 0, 0, 0, 793, 794, 795, 796, 797, 798, 799, 800, 801, 802, 803, 804,
        0, 0, 0, 0, 805, 806, 807, 808, 809, 810, 811, 812, 813, 814, 815, 816,
        0, 0, 0, 0, 817, 818, 819, 820, 821, 822, 823, 824, 825, 826, 827, 828,
        0, 0, 0, 0, 829, 830, 831, 832, 833, 834, 835, 836, 837, 838, 839, 840,
        0, 0, 0, 0, 841, 842, 843, 844, 845, 846, 847, 848, 849, 850, 851, 852,
        0, 0, 0, 0, 853, 854, 855, 856, 857, 858, 859, 860, 861, 862, 863, 864,
        0, 0, 0, 0, 865, 866, 867, 868, 869, 870, 871, 872, 873, 874, 875, 876,
        0, 0, 0, 0, 877, 878, 879, 880, 881, 882, 883, 884, 885, 886, 887, 888,
        0, 0, 0, 0, 889, 890, 891, 892, 893, 894, 895, 896, 897, 898, 899, 900
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
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 360,
          width = 480,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 0,
          width = 40,
          height = 360,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 240,
          width = 480,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 0,
          width = 40,
          height = 280,
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
          id = 8,
          name = "entry",
          type = "",
          shape = "point",
          x = 594,
          y = 325,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "spawn",
          type = "",
          shape = "point",
          x = 400,
          y = 320,
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
      id = 3,
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
          id = 6,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 280,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["facing"] = "right",
            ["map"] = "castletown_main",
            ["marker"] = "entry2"
          }
        },
        {
          id = 7,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 271,
          y = 240,
          width = 100,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* (The rubble on the ground seems to have been dusted and polished.)",
            ["text2"] = "* (Someone around here really cares about the details.)"
          }
        }
      }
    }
  }
}
