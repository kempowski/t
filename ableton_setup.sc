tidal to ableton

s.options.numBuffers = 1026*2;
s.options.memSize = (512*1024);
s.options.device = "Soundflower (64ch)";
s.options.numOutputBusChannels = 16;
s.waitForBoot {
	~dirt = SuperDirt(2, s);
	~dirt.loadSoundFiles("/Users/jk/Documents/Music/tidal_samples/*"); // specify sample folder to load
	s.sync;
	~dirt.start(57120, [0,2,4,6,8,10,12,14]);
};