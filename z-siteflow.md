# General Flow

# /Layout/
    **Header links to /About/ page (currently homepage which is fine)
    **Navbar

# /Homepage/
    General info
    Navbar with: about, login, signup
    - /About/
            Basically the info in the readme
    - /Log In/
            Login form
                redirect_to user show page
    - /Sign Up/
            sign up form
            redirect_to login

# /User Page/ [user show page]
    Navbar with: Crafts, Supplies, Logout

    --link-- My Supplies
        link_to supplies#index
    **My Crafts - tiled effect of crafts of your choosing that link to the craft's show page, showing what supplies are available
    - /Crafts/
        --Categories
            --list of craft categories
        --All Crafts
            --link_to crafts#index
        --My Crafts
            --link_to users#crafts
    - /Supplies/
        --Categories
            --list of supply categories
        --All Supplies
            --link_to supplies#index
    - /Log Out/
        Are you sure? y/n
        y -- redirect_to homepage
        n -- redirect_to previous page(??)

            