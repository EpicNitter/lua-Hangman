---GAMEPLAN---
--Logic




--Data
 make the player select 1p or 2p
 make sure that if they select 1p then they will go up against ai
 make it so if they select 1p then they will versus ai
 if they pick 2 player then get player 1 and 2's username
otherwise get ai to do it



---VARIABLES---
local selectedVersion 
local playerName = io.read()
local secondPlayerName 

local WelcomeText = ("Hello".. playerName.. "choose your route")

local button1 = "1p"
local button2 = "2p

local playerSelectedSpot = {}

local computerSelectedSpot = {}

local BoardPosition ={1,2,3,4,5,6,7,8,9}


local winningCombinations = {
    {1, 2, 3},  -- Top row
    {4, 5, 6},  -- Middle row
    {7, 8, 9},  -- Bottom row
    {1, 4, 7},  -- Left column
    {2, 5, 8},  -- Middle column
    {3, 6, 9},  -- Right column
    {1, 5, 9},  -- Top-left to bottom-right diagonal
    {3, 5, 7}   -- Top-right to bottom-left diagonal
}

local gameFinished = false
local gameRunning = false
local currentTurn = nil









---//FUNCTIONS\\---



local function displayMenu()
     if playerName then
     print("Choose your fate")
       print(button1)
       print(button2)        
  end 
end

local CanMove = nil
local function findWinningMove(playermark)
      for index, _ in pairs(winningCombinations) do
          if playermark == index then 
             CanMove = false
 end
                 
            if playermark ~= index then
             CanMove = true
                return CanMove
     end 
 end
end






-- A sample board with a few moves
local board = {"X", " ", "O", " ", "X", " ", "O", " ", "X"}

-- A function to display the board
local function printBoard(board_state)
    -- Print the first row
    print(board_state[1] .. " | " .. board_state[2] .. " | " .. board_state[3])
    print("---------")
    -- Print the second row
    print(board_state[4] .. " | " .. board_state[5] .. " | " .. board_state[6])
    print("---------")
    -- Print the third row
    print(board_state[7] .. " | " .. board_state[8] .. " | " .. board_state[9])
end



local function aiTurn()
    
end


local function getInputs(input_line)
    if input_line == button1 then

  end
end
