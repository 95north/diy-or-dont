# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create({username: "Tori", location:"Brooklyn, NY", password: "Birthday"})
u2 = User.create({username: "XO", location:"New York, NY", password: "Birthday"})
u3 = User.create({username: "TT Gabor", location:"Philadelphia, PA", password: "Birthday"})
u4 = User.create({username: "Steph", location:"Buna, TX", password: "Birthday"})
u5 = User.create({username: "Ben", location:"Oakland, CA", password: "Birthday"})

p1 = Project.create({name:"Re-Grout Shower", overview:"Use a thin tool to remove old grout and caulk, replace grout, squeegee clean as go, add new caulk, seal grout.", description:"Pending", image:""})
p2 = Project.create({name:"Fix Leaky Faucet", overview:"Turn off water supply, remove knobs, add new washers, or headset if needed", description:"Pending", image:""})
p3 = Project.create({name:"Dog cabin", overview:"Cut wood (straight cuts only) and drill it together", description:"Pending", image:""})
p4 = Project.create({name:"Install Window", overview:"Cut hole in wall, install window framing, window glass, panes", description:"Pending", image:""})
p5 = Project.create({name:"Replace Linoleum Tile", overview:"Remove old damaged tiles, replace with shiny new ones", description:"Pending", image:""})

s1 = Supply.create({name: "Wood - 2x4", description: ""})
s2 = Supply.create({name: "Plywood - 1/2inch", description: ""})
s3 = Supply.create({name: "Wood screws", description: ""})
s4 = Supply.create({name: "Sink Washers", description: "Come in multiple sizes, bring old washer to hardware store for sizing"})
s5 = Supply.create({name: "Adjustable Crescent Wrench", description: "aka Monkey Wrench"})
s6 = Supply.create({name: "Power Drill", description: "Don't forget the drill bits!"})
s7 = Supply.create({name: "Molding", description: "Read up on angles to cut corners at"})
s8 = Supply.create({name: "Squeegee", description: ""})
s9 = Supply.create({name: "Grout mix", description: "Wear a particulate mask! Dust is carcinogenic."})
s10 = Supply.create({name: "Grout Removal Tool", description: "Looks like a screwdriver with a triangle at the end"})
s11 = Supply.create({name: "Screwdriver", description: ""})
s12 = Supply.create({name: "Window pane", description: "Measure"})
s13 = Supply.create({name: "Lineoleum Tiles", description: "Always buy an extra box or two for when they stop producing design."})
s14 = Supply.create({name: "Circle Saw", description: ""})


up1 = UserProject.create({user_id: 1, 
    project_id: 1, 
    status:"Completed", 
    usernote:"Never again.", 
    reviewDifficulty: 3,
    reviewFun: 1, 
    reviewTime: 25,
    reviewText: "MISERABLE project. Buy the tool! Don't use a butterknife."
})
up2 = UserProject.create({user_id: 1, 
    project_id: 2, 
    status:"Completed", 
    usernote:"Have extra washers leftover", 
    reviewDifficulty: 1,
    reviewFun: 4, 
    reviewTime: 1,
    reviewText: "Fun, easy & satifying!"
})
up3 = UserProject.create({user_id: 5, 
    project_id: 4, 
    status:"Completed", 
    usernote:"", 
    reviewDifficulty: 3,
    reviewFun: 3, 
    reviewTime: 5,
    reviewText: "Made this as a set prop, so leak-proof / polish appearance not a problem. Held up for the two weeks we used it! "
})
up4 = UserProject.create({user_id: 4, 
    project_id: 2, 
    status:"Not Started", 
    usernote:"", 
    reviewDifficulty: 1,
    reviewFun: 3, 
    reviewTime: 2,
    reviewText: "Ball-style kitchen sink at Nana's."
})

us1 = UserSupply.create({
    user_id: 1,
    supply_id:3,
    quantity: 99,
    measurement: "Have a mixed pack!",
    userneeds: false,
})
us2 = UserSupply.create({
    user_id: 1,
    supply_id:4,
    quantity: 12,
    measurement: "Have a mixed pack!",
    userneeds: false,
})
us3 = UserSupply.create({
    user_id: 5,
    supply_id:2,
    quantity: 4,
    measurement: "Have 4 sheets leftover from project",
    userneeds: false,
})

ps1 = ProjectSupply.create({
    project_id: 2,
    supply_id: 4,
    quantity: 1,
    note: "Make sure to get correct size! Bring old one to hardware store",
    mandatory: true
})
ps2 = ProjectSupply.create({
    project_id: 1,
    supply_id: 10,
    quantity: 1,
    note: "There are several alternatives.",
    mandatory: false
})
ps3 = ProjectSupply.create({
    project_id: 3,
    supply_id: 1,
    quantity: 1,
    note: "8 foot length for small dog house, 24 feet for large dog house",
    mandatory: true
})
ps4 = ProjectSupply.create({
    project_id: 3,
    supply_id: 2,
    quantity: 1,
    note: "One 4x8 sheet for small dog, three for a huge doghouse",
    mandatory: true
})
ps5 = ProjectSupply.create({
    project_id: 3,
    supply_id: 3,
    quantity: 70,
    note: "You can get it done with only 3 inch screws, mix is better if possible",
    mandatory: true
})
ps6 = ProjectSupply.create({
    project_id: 3,
    supply_id: 14,
    quantity: 1,
    note: "Jigsaw, handsaw, will also get job done.",
    mandatory: false
})


