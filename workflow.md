# Objects to Manipulate
- for mvp, not dealing with colors

- Users

- Crafts
    - craft category, broad
- Projects
    - specific project
    - stretch goal: 




    User - creates project

    Project - a specific undertaking by a user
    - belongs to user
    - has many crafts through project_crafts
        # has many crafts_projects
    - has many supplies through crafts
    - has many tools through crafts

    Craft - a general project - knit a scarf! make some shelves! etc
    - belongs to category
    - has many projects through project_crafts
        # has many crafts_projects
    - has many supplies through supply_crafts
        # has many crafts_supplies
    - has many tools through tool_crafts
        # has many crafts_tools
    
    Supply - a craft supply
    - has many supplies through crafts_supplies
        # has many crafts_supplies
    - has many projects through crafts

    Tool - a tool used for crafting
    - has many crafts through crafts_tools
        # has many crafts_tools
    - has many projects through crafts

    Category
    - has many crafts
    - has many supplies through crafts
    - has many tools through crafts

    CraftsSupply
    - belongs to supply
    - belongs to craft

    CraftsTool
    - belongs to tool
    - belongs to craft

    CraftsProject
    - belongs to project
    - belongs to craft


