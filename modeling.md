DON'T DO TOOLS YET. THEY ARE THE SAME AS SUPPLIES AND A LATER PROBLEM.

Supply
    - Name
    - Notes
    - Count (??)


Supply Category
    - Name
    - Notes

Craft
    - Name
    - Notes


Craft Category
    - Name
    - Notes

User


Supply
    - belongs_to :supply_category
    - used for many crafts
        - has_many :crafts_supplies
        - has_many :crafts, through: :crafts_supplies
    

Supply Category
    - has_many :supplies

Craft
    - belongs_to :craft_category
    - uses many supplies
        - has_many :crafts_supplies
        - has_many :supplies, through: :crafts_supplies


Craft Category
    - has_many :crafts