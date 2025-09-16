---START---

print("Enter your name")

local playerName = io.read()


print("\n--- Current Leaderboard ---")
showLeaderboard()


---VARIABLES



local WelcomeText = "Welcome Player"

local NUMBER_OF_GUESSES = 8
local VictoryMessage = "YOU WIN!!!"
local LossMessage = "YOU LOST!!!"
local PromptForLetter = "Please Input the letter Please"


local victory = nil
local loss = nil 


 
  
  
local hangman_Art =  [[
  +---+
  |   I
  O   I
 /|\  I
 / \  I
      I
========
]]

print(hangman_Art)
  print(                                              "HANG MAN")
  

local lettersGuessed = {}

local word_list = {
    "apple",
    "banana",
    "computer",
    "xylophone",
    "rhythm",
    "jazz",
    "galaxy",
    "quaff",
    "unusual",
    "vortex"
}

local guesses = 10

-----------------------------------WORK IN PROGRESS---------------------------------------

local leaderboard = {}
---FUNCTIONS---


local function showLeaderboard()
    table.sort(leaderboard, function(a,b)
    return a.guessesLeft > b.guessesLeft

end)

            print("\n--- LEADERBOARD ---")

  for i, entry in ipairs(leaderboard) do
    local status = entry.won and "WIN" or "LOSS"
     
       print(i .. ". " .. entry.name .. " - " .. status .. " - Guesses Left: " .. entry.guessesLeft)
    end 
end 


local function getRandomWord()
     local word_number = math.random(1, #word_list)
     return word_list[word_number]
end

local function isLetterGuessed(letter)
    for _, guessedLetter in ipairs(lettersGuessed) do
        if guessedLetter == letter then
            return true
        end
    end
    return false
end

local function CheckLetter(letter, word)
     for i = 1, #word do
           local l = string.sub(word, i, i)
          -- print(l)
          -- print(letter)
          -- print("----")
           if l == letter then
              return 1 
            
           end
           
     end
     return 0
end

local function getLetterFromUser()
  local correct_input = 0
  local input_line
  local final_guess
  while correct_input == 0 do

      print("Please provide a letter")
     
      input_line = io.read()
      
      if input_line and #input_line == 1 then
        local guess = string.lower(input_line)
      print("you guessed: ", guess)
      
        if isLetterGuessed(guess) then 
            print("You already guessed that letter!")
            else 
              table.insert(lettersGuessed, guess)
              final_guess = guess 
              correct_input = 1 
          end 
      end
  end
  return final_guess
end 


local function fillLetters(Guessingword, letter, CurrentGuess)
  
  
  for i = 1, #Guessingword do 
        
        local currentLetter = string.sub(Guessingword, i, i)
        if currentLetter == letter then 
            CurrentGuess[i] = letter
            
          end 
    end 
end 

local function saveLeaderboard(filename)
    local file = io.open(filename, "w")
    if not file then
        print("Failed to save leaderboard!")
        return
    end

    file:write("return {\n")
    for _, entry in ipairs(leaderboard) do
        file:write(string.format("  { name = %q, won = %s, guessesLeft = %d },\n",
            entry.name, tostring(entry.won), entry.guessesLeft))
    end
    file:write("}\n")
    file:close()
end



local function loadLeaderboard(filename)
    local ok, data = pcall(dofile, filename)
    if ok and type(data) == "table" then
        return data
    else
        return {}
    end
end

leaderboard = loadLeaderboard("leaderboard.lua")


local function CheckVictory(GuessingWord, CurrentGuess)
   local fullWord = table.concat(CurrentGuess, "")
   
    if fullWord == GuessingWord then 
           return true 
           else 
             return false 
      end 
  end 

      showLeaderboard()

---FUNCTIONS END---
--- MAIN ---

print(WelcomeText)

local GuessingWord = getRandomWord()
local gLength = #GuessingWord

local currentGuess = {}


for i = 1, #GuessingWord do
     currentGuess[i] = "_"
     
end 

-- print(table.concat(currentGuess, " "))
-- local LetterFromUser = getLetterFromUser()
-- print(GuessingWord)
-- print(LetterFromUser)
-- print(CheckLetter(LetterFromUser, GuessingWord))


-- fillLetters(GuessingWord, LetterFromUser, currentGuess)
-- print(table.concat(currentGuess, "")
print(HangMan)
repeat 
    
  print(table.concat(currentGuess, " "))
  local LetterFromUser = getLetterFromUser()
  print(LetterFromUser)
  
  if CheckLetter(LetterFromUser, GuessingWord) == 1 then
      print("You got", LetterFromUser)
      fillLetters(GuessingWord, LetterFromUser, currentGuess)
    else
      NUMBER_OF_GUESSES = NUMBER_OF_GUESSES - 1 
      print("You have "..NUMBER_OF_GUESSES.." more guesses")
  end
  
  victory = CheckVictory(GuessingWord, currentGuess)
       
  if victory == true then
             print(VictoryMessage)
             break
             
  end 
       
  if NUMBER_OF_GUESSES <= 0 then
    loss = true 
  end 
    
  print(table.concat(currentGuess, ""))
until  victory or loss == true
         
if victory then
      print(VictoryMessage)
elseif loss then
      print(LossMessage)
  end 

 for i, 
local result = {
   name = playerName,
   won = victory,
   guessesLeft = NUMBER_OF_GUESSES


}

table.insert(leaderboard, result)


 --Save updated leaderboard File
leaderboard = saveLeaderboard("leaderboard.lua")



--show leaderboard
showLeaderboard()