SEED WITH INFO FOR DEMONSTRATION

general layout:
add footer
change radio buttons to sliders
custom formatting on all buttons
change literally all colors


user:
add ability to edit information

homepage:

- make it so that the boxes are centered even when there are less than three
- add delay so things feel a bit less abrupt

Add Supplies:

There are validations in place, but I don't have error messages for them. Goal: make it so that already-in-place fieldswitherrors can be used


/////////


supply belongs to user
RIGHT NOW YOU CAN ONLY HAVE ONE INSTANCE OF A SUPPLY AND ANYTHING ABOUT NUMBER HAS TO BE IN NOTES


bulk add to craft BUT ONLY CAN ADD ALREADY EXISTING SUPPLIES

cannot add supplies directly to craft_category, must be done through craft



homepage: one big fuckin picture as the background with a welcome message

bringing about page back into existence

other join table is craft_categories_user
    aka Favorites


user can create supply categories
user cannot create craft categories


show page for craft category

DESIGN
    2 big boxes! Crafts, Supplies
    Crafts --> craft index for Category (craftcategory/:id/crafts)
        - see list of crafts


    Supplies --> supply index page for Category
    (craftcategory/:id/supplies)
        - see full list of supplies in this category

