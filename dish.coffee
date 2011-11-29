class Dish
  constructor: (@life) ->
    
  evolve: () ->
    evolveCell = (count, row, col, life) ->
      if (life[row][col] is 1 and count > 1 and count < 4) or (life[row][col] is 0 and count is 3)
        return 1
      else 
        return 0    

    ###
      creating an empty 2d array
    ###
    newLife = []
    newLife.push [0] for i in [0..@life.length-1]
    
    newLife[row][col] = evolveCell(this.livingNeigbours(row, col), row, col, @life) for col in [0..@life[0].length-1] for row in [0..@life.length - 1]
    
    new Dish newLife
    
  livingNeigbours: (row, col) ->
    isCellAlive = (ro, co, life) ->
      if (ro < 0 or co < 0) or (ro is row and co is col) or (ro > (life.length - 1) or co > (life[0].length - 1))
        return 0
      else
        return life[ro][co]
        
    count = 0
    count = count + isCellAlive((row + rowOffset), (col + colOffset), @life) for colOffset in [-1,0,1] for rowOffset in [-1,0,1]
        
    return count
    
  toString: () ->
    console.log @life  
        
dish = new Dish [ 
  [0,0,0,0,0], 
  [0,0,0,0,0], 
  [0,1,1,1,0], 
  [0,0,0,0,0], 
  [0,0,0,0,0], 
  ]
dish.evolve().toString()

dish = new Dish [ 
  [ 0,1,0,0,0,0,0,0,0,0,0,0],
  [ 0,0,1,0,0,0,0,0,0,0,0,0],
  [ 1,1,1,0,0,0,0,0,0,0,0,0],  
  [ 0,0,0,0,0,0,0,0,0,0,0,0],
  [ 0,0,0,0,0,0,0,0,0,0,0,0],
  [ 0,0,0,0,0,0,0,0,0,0,0,0],
  [ 0,0,0,0,0,0,0,0,0,0,0,0],
  [ 0,0,0,0,0,0,0,0,0,0,0,0], 
  [ 0,0,0,0,0,0,0,0,0,0,0,0],
  [ 0,0,0,0,0,0,0,0,0,0,0,0],
  [ 0,0,0,0,0,0,0,0,0,0,0,0]
  ]           


dish = dish.evolve()
dish.toString()
dish = dish.evolve()
dish.toString()


