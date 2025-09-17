
print("What is your name?")
local playerName = io.read()
local Number = 10
local WelcomeText = "Welcome, " .. playerName .. "!"

---VARIABLES
local NUMBER_OF_GUESSES = 8
local VictoryMessage = "YOU WIN!!!"
local LossMessage = "YOU LOST!!!"
local PromptForLetter = "Please Input the letter Please"

local hintUsed = false
local victory = nil
local loss = nil 

local HintTable 

  
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
    { word = "apple", hint = "A red or green fruit." },
    { word = "banana", hint = "A yellow fruit." },
    { word = "computer", hint = "Electronic device you're using now." },
    { word = "xylophone", hint = "A musical instrument with bars." },
    { word = "rhythm", hint = "A musical beat pattern." },
    { word = "jazz", hint = "A genre of music with improvisation." },
    { word = "galaxy", hint = "A massive system of stars." },
    { word = "quaff", hint = "To drink something quickly." },
    { word = "unusual", hint = "Not common." },
    { word = "vortex", hint = "A whirling mass of fluid or air." }
}


local guesses = 10

---FUNCTIONS---



local function getRandomWord()
     local entry = word_list[math.random(1, #word_list)]
	return entry.word, entry.hint
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

local function getLetterFromUser(Hint)
	local correct_input = false
	local final_guess

	while not correct_input do
		print("Please provide a letter (or type 7 to get a hint, costs 1 guess)")

		local input_line = io.read()

		if input_line then
			input_line = string.lower(input_line)

			-- HINT REQUEST
			if input_line == "7" then
				if not hintUsed then
					print("Hint: " .. Hint)
					hintUsed = true
					NUMBER_OF_GUESSES = NUMBER_OF_GUESSES - 1
					print("You lost 1 guess for using a hint.")
				else
					print("You already used your hint!")
				end
			elseif #input_line == 1 and input_line:match("%a") then
				local guess = input_line

				if isLetterGuessed(guess) then
					print("You already guessed that letter!")
				else
					table.insert(lettersGuessed, guess)
					final_guess = guess
					correct_input = true
				end
			else
				print("Invalid input. Enter a single letter or 7 for a hint.")
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

local function CheckVictory(GuessingWord, CurrentGuess)
   local fullWord = table.concat(CurrentGuess, "")
   
    if fullWord == GuessingWord then 
           return true 
           else 
             return false 
      end 
  end 

local function SacrificeGuess(guess)
   guess = guess - 1
     return guess
end

---FUNCTIONS END---
--- MAIN ---

print(WelcomeText)

local GuessingWord, Hint = getRandomWord()
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
  local LetterFromUser = getLetterFromUser(Hint)
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