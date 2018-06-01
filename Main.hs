--https://uva.onlinejudge.org/index.php?option=com_onlinejudge&Itemid=8&category=11&page=show_problem&problem=889
-- import Data.Map (Map)
-- import qualified Data.Map as Map

module FibDo where


-- OLD FIBONACCIcuj
-- fib :: Integer -> Integer
--
-- fib 1 = 1
-- fib 2 = 2
-- fib x = fib (x - 1) + fib (x - 2)

nextTripleIfCurrentNIsLessThanN :: (Int, Integer, Integer) -> Int -> (Int, Integer, Integer)
nextTripleIfCurrentNIsLessThanN (currentN, x, y) n = if currentN < n
then nextTripleIfCurrentNIsLessThanN (currentN + 1, y, x + y) n
else (currentN, x, y)

thirdElementOfTriple :: (x,y,z) -> z
thirdElementOfTriple (x,y,z) = z

fibonacci :: Int -> Integer
fibonacci n = thirdElementOfTriple (nextTripleIfCurrentNIsLessThanN (0,0,1) n)

-- reverseList [] = []
-- reverseList (x:xs) = reverseList xs ++ [x]



-- fibdo a = map (fibonacci) a
--
-- my_list = fibdo [1..50]
-- my_list_else = reverseList my_list

--"fibonacci 5" returns 5th fibonacci number
elementsPostFinding 0 0 = ""
elementsPostFinding fnum remaining = if ((fibonacci remaining) <= fnum)
  then ("1" ++ (elementsPostFinding (fnum - fibonacci (remaining)) (remaining -1)))
  else ("0" ++ (elementsPostFinding (fnum) (remaining -1)))

elements 0 0 = ""
elements fnum remaining =
  if ((fibonacci remaining) <= fnum) then ("1" ++ elementsPostFinding (fnum - fibonacci (remaining)) (remaining -1))
    else (elements (fnum) (remaining -1))


-- fibs :: [Integer]
-- fibs = unfoldr (\(f,s) -> Just (f,(s,f+s))) (0,1)
