// If DebugView isn't doing anything, make sure that the game and LiveSplit are online.
// The problem can also be that under DebugView>Capture, "Capture Win32" is disabled.


state("flashplayer11_7r700_224_win_sa")
{
	int levelTimesEight : 0x0091BA44, 0x0, 0x8, 0xC, 0x5C, 0xFFC, 0x18, 0x7C;
	int grenadesOnLevelOne : 0x0093B1EC, 0x2B8, 0xC, 0x8C, 0x478, 0x94, 0x50, 0x60;
}

startup
{
	vars.TimerModel = new TimerModel { CurrentState = timer }; // For resetting the timer when the game is exited.
}

start
{
	// TODO: Start the timer when one of the difficulty buttons is clicked on the first level.
	// print(current.grenadesOnLevelOne.ToString());
	if (old.grenadesOnLevelOne < 0 && current.grenadesOnLevelOne == 24) { // This requires restarting the exe.
		return true;
	}
}

split
{
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