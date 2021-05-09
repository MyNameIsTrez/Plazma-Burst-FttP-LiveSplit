// If DebugView isn't doing anything, make sure that the game and LiveSplit are online.
// The problem can also be that under DebugView>Capture, "Capture Win32" is disabled.


state("flashplayer11_7r700_224_win_sa")
{
	int levelTimesEight : 0x0091BA44, 0x0, 0x8, 0xC, 0x5C, 0xFFC, 0x18, 0x7C
}

update
{
	print(current.levelTimesEight.ToString());
}

startup
{
	print("[AutoSplitter] STARTUP");
}

init {
	print("[AutoSplitter] INIT");
}

split
{
	print("[AutoSplitter] SPLIT");
	// print(current.levelTimesEight);
}