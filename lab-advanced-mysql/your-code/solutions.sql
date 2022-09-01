-- Challenge 1 - Most Profiting Authors

-- Step 1: Calculate the royalties of each sales for each author

select t.title_id as title_id , a.au_id as author_id, 
(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) as sales_royalty 
from authors as a
	inner join titleauthor as ta
		on a.au_id = ta.au_id
	inner join titles as t
		on ta.title_id = t.title_id 
	inner join sales as s
		on t.title_id = s.title_id;
        
-- Step 2: Aggregate the total royalties for each title for each author

select t.title_id as title_id , a.au_id as author_id, 
(sum(t.price) * sum(s.qty) * sum(t.royalty) / 100 * sum(ta.royaltyper) / 100) as sales_royalty 
from authors as a
	inner join titleauthor as ta
		on a.au_id = ta.au_id
	inner join titles as t
		on ta.title_id = t.title_id 
	inner join sales as s
		on t.title_id = s.title_id
group by a.au_id, t.title_id;

-- Step 3: Calculate the total profits of each author

-- Challenge 2 - Alternative Solution


-- Challenge 3
 
