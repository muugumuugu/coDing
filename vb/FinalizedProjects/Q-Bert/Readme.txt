Hello and thanks for downloading Q-Bert II!
Table Of Contents:
1) Introduction
2) How the code works
3) Some level tips
4) Visit & contact

---------------------------------
-				-
-	   Introduction         -
-				-
---------------------------------
Q-Bert II is the totally improved version of Q-Bert.
Some new features of Q-Bert II over Q-Bert:
-Ability to save high scores
-Ability to save games!
-Up to 999 levels!
-More baddies!
-Doors and keys!
-Walls!
-Guns, so Q-Bert isn't defensless!
-Level Editor!
-Much more...
Make sure you check out the level editor, too! It allows you to make your own
Q-Bert II levels! If you have any you think are good, send them to:
drmayerson@lycos.co.uk.
Included with the Q-Bert II executive file is ten levels.
for more levels and updates on Q-Bert II, see the Damadros Web-site
http://www.damadros.cjb.net

---------------------------------
-				-
-       How the code works      - (this isn't really interesting for non-programmers)
-				-
---------------------------------
Q-Bert II has a structure that can be rather confusing to the novice
programmer.
Here is a sample game that will explain most of the functions in Q-Bert II.
Let's say Fred starts up the game. He has never seen it before.
First, Fred will see the splash form frmSplash, which displays Q, Bert and II
growing larger and then a line flashing.
This is done by the Timer on the form which counts the milliseconds and executes
a move every ... milliseconds.
Now, Fred will get the main screen (the splash screen can be short-circuited by clicking on it).
The main screen displays the first level, level001.lvl, no matter what that level may be.
Very much a beginning gamer, Fred starts off by getting as much info about the program as possible.
He clicks on About in the Help menu. He gets a modal form,
which means he has to click OK before getting back to the frmGame.
Then, he clicks on Help in the menu Help. He gets the modal Help form.
Now, he feels confident enough about the game to begin a game. He selects New Game
from the Game menu, which triggers mnuStopGame_Click, and starts the game by
putting the value YESGAME into the GameStatus variable.
He then wanders around on the field, triggering the KeyDown Sub, which triggers the
KeyPressed Sub, which triggers the Hero.Move sub. The latter sub makes Q-Bert move over
the blocks.
He reaches the right-middle cage with the gun and key in it, he opens the door, by hitting
the space bar, which triggers the KeyDown Sub, which triggers the KeyPressed sub, which
triggers the Hero.OpenDoors sub, which opens the door. He gets the key and gun, adding them to
the inventory (which happens in the Hero.Move sub)
He then opens the baddie cage, and shoots the first two baddies (by calling the Hero.Shoot sub,
which calls the Hero.ShootBaddie sub eventually). Now the baddies are free to move, and this
happens in tmrEverything, who has been timing all the time, but doing nothing because the
baddies couldn't move. Now that they can, the tmrEverything calls the Baddie.Move sub for
every baddie, in turn.
Eventually, Fred finishes the first level by jumping on the Transporter block in the lower-left
corner and starts a new level. He is asked if he wants to save his game and he does, calling
the SaveGame Sub (called from within the InitLevel sub) and it saves it, using
a commondialog box.
Now Fred is tired and shuts the program down. The next day, he starts playing Q-Bert II again.
He decides to start from where he left off and he selects Load Game from the Game menu.
That triggers the LoadGame sub, which lets Fred open his game through a commondialog box.
The LoadGame triggers a InitLevel Sub for the level that was saved, and Fred starts playing
again.
Eventually, he runs in to a baddie and that ends his game. (He ran into the baddie, meaning
the killing happened in the Hero.Move sub.) He gets a message stating to enter his name,
because he scored a high score (this inputbox is invoked from the mdlMain.CheckHighScore sub)
Fred enters his name and gets the high score form displayed (invoked from ViewHighScores, which
is invoked from CheckHighScores) Fred, content with the game, closes it.

I apologize if this was unneccesary or unclear, but I felt I needed to do something to
ease the understanding of the code.

---------------------------------
-				-
-	Some level tips         -
-				-
---------------------------------
The first ten levels vary from being extremely easy to moderate. If you can't get through the
first five levels, read the help file, and read it carefully. Levels 6-10 are slightly trickier,
but precise work and reasoning makes short work of them.
Then, there's levels 11-20. See below for some tips. Try them without the tips first! If the tips
still don't help you, contact me for more help.

Specific level tips:
Level 11: Do all other blocks FIRST. The two trapblocks (blocks that release the baddies) are
located on opposite sides of the lower unlocked door.

Level 12: You'll notice that you have 8 bullets, and 9 baddies. Kill all baddies except for the
one guarding the yellow key. Then, unlock that door, and trap the baddie in the corner above the
the yellow key (how to trap them I won't give away; you should know that pretty much by now
already). Then, get the key and do the rest of the blocks.

Level 13: Pretty straightforward, just keep in mind that the more baddies are active, the slower
that each individual one moves. Two trapblocks are located right to the starting position;
the other two right in front of the doors.

Level 14: It's up to you here, how to handle it. Either don't fire any bullets and keep the
many baddies slow (you'll have to kill some, at least), or kill eight and run from the rest.

Level 15: This one is pretty much impossible if you step on all the trapblocks right away.
The trapblocks are located on the second and third block of the first row, and the first three
blocks on the second row. Step right two blocks (freeing four baddies), and then do all the
blocks you can without running into any baddies; then step on the remaining trapblocks and run
for it.

Level 16: Again, pretty straightforward. Just kill the first eight baddies there (you have to),
then use the regular techniques to get the rest of the blocks. (If you don't know 'the regular
techniques', it's time to play levels 1-10 again).

Level 17: Once again, straightforward. Just avoid and conquer.

Level 18: The granddaddy of them all. My pride. My creation. The amount of times this level has
been completed is exactly one. The trick, of course, is to speed on down (the trap blocks are on
the way, as the slowpoke will observe), do all the reachable blocks; somehow trap the baddies in
the maze, and do the upper-left blocks. Good luck.

Level 19: May look intimidating, but once you've done 18, this should be a piece of cake. Try
doing all the blocks except the first column (trapblocks). Then do the trapblocks. Also make sure
to lure one or more baddies onto the same row, otherwise they'll corner you!

Level 20: Here, the cornering feared in level 19 has become a reality. The trick is to free but
one pair of baddies, get them out of their cornering positions (do all available blocks while
you're at it), and you're off.

Complete these twenty levels, and get a special prize. Or not, actually. But if you really
enjoyed the game, you might want to try out the level editor; share your creative spirit in
the form of extra levels. Credit is given for them (not money credit; creation credit)

And if you liked the levels, stay tuned for more to come, from the Damadros Web-site!

---------------------------------
-				-
- 	 Visit & contact        -
-				-
---------------------------------
For more games, plans, utilities, webapps, and much more, visit the Damadros Web-site:
http://damadros.cjb.net
To contact me (on the Damadros site you can find my addresses, too):
drmayerson@lycos.co.uk
Note that my e-mail address used to be drmayerson@tiscalinet.be. I believe I have deleted all
references of this address in the source code and documentation, however, if such an outdated
address appears, it should read drmayerson@lycos.co.uk. Don't send to the Tiscalinet address.