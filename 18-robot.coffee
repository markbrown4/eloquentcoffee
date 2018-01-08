###

Write a function compareRobots which takes two robots (and their starting
memory). It should generate a hundred tasks, and let each of the robots solve
each of these tasks. When done, it should output the average number of steps
each robot took per task.

For the sake of fairness, make sure that you give each task to both robots,
rather than generating different tasks per robot.

###

{
  routeRobot
  goalOrientedRobot
  VillageState
  findRoute
  roadGraph
} = require('./lib/robots')

countTurns = (state, robot, memory) ->
  turns = 0
  while state.parcels.length > 0
    action = robot state, memory
    state = state.move action.direction
    memory = action.memory
    turns++

  turns

average = (nums) ->
  sum = nums.reduce (acc, value, index) ->
    acc + value

  sum / nums.length

compareRobots = (robot1, memory1, robot2, memory2) ->
  turns1 = []
  turns2 = []
  for i in [1..100]
    state = VillageState.random()
    turns1.push countTurns(state, robot1, memory1)
    turns2.push countTurns(state, robot2, memory2)

  average1 = average turns1
  average2 = average turns2

  console.log """

  After 100 simulations:
  - #{robot1.name} had an average of #{average1} turns
  - #{robot2.name} had an average of #{average2} turns

  #{if average1 < average2 then robot1.name else robot2.name} is the better robot.
  """

compareRobots routeRobot, [], goalOrientedRobot, []

###

Can you write a robot that finishes the delivery task faster than
goalOrientedRobot? If you observe that robot’s behavior, what obviously stupid
things does it do? How could those be improved?

###

efficientRobot = ({ place, parcels }, route) ->
  if route.length == 0
    routes = parcels.map (parcel) ->
      if parcel.place != place
        route: findRoute(roadGraph, place, parcel.place)
        pickup: true
      else
        route: findRoute(roadGraph, place, parcel.address)
        pickup: false

    score = ({ route, pickup }) ->
      (if pickup then 0.5 else 0) - route.length

    route = routes.reduce((a, b) ->
      if score(a) > score(b) then a else b
    ).route

  direction: route[0]
  memory: route.slice(1)

compareRobots efficientRobot, [], goalOrientedRobot, []
