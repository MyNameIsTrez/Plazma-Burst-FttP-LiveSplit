// If DebugView isn't doing anything, make sure that the game and LiveSplit are online.
// The problem can also be that under DebugView>Capture, "Capture Win32" is disabled.


state("flashplayer11_7r700_224_win_sa")
{
	int levelTimesEight : 0x0091BA44, 0x0, 0x8, 0xC, 0x5C, 0xFFC, 0x18, 0x7C;
}

startup
{
	vars.TimerModel = new TimerModel { CurrentState = timer }; // For resetting the timer when the game is exited.
}

update
{
	// TODO: Start the timer when one of the difficulty buttons is clicked.

	// new and current unfortunately both start at 8.
	// print(old.levelTimesEight.ToString() + ", " + current.levelTimesEight.ToString());
}

split
{
	// print("current.levelTimesEight: " + current.levelTimesEight.ToString());
	// print("old.levelTimesEight: " + old.levelTimesEight.ToString());

	// On game resets, old.levelTimesEight is the first level.
	// On game restarts, old.levelTimesEight is the last level that is still unlocked.
	if (current.levelTimesEight != 0 && old.levelTimesEight != 0 && // When the game is started/reset, levelTimesEight is 0 for both current and new.
		current.levelTimesEight > old.levelTimesEight) { // If it is the next level. Also circumvents the bug where current.levelTimesEight is 2 when closing the game.
		return true;
	}
}

exit
{
	vars.TimerModel.Reset();
}