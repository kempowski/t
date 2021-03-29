include("SuperDirt")

SuperDirt.start;

SuperDirt.start(57120, [0, 2, 4, 6]);

~dirt.start(57120, [0, 2, 4, 6, 8, 10]);


ServerOptions.devices;

ServerOptions.outDevices; // output devices

Server.default.options.outDevice_("ASIO : Voicemeeter Insert Virtual ASIO");

s.options.outDevice_("ASIO : Voicemeeter Potato Insert Vi...");
s.options.inDevice_("ASIO : Voicemeeter Potato Insert Vi...");

MIDIClient.init;
~midiOut = MIDIOut.newByName("K-2", "K-2");
~midiOut = MIDIOut.newByName("UMC1820 MIDI Out", "UMC1820 MIDI Out");
~midiOut.latency = 0;
~dirt.soundLibrary.addMIDI(\midi, ~midiOut);

~midiOut= MIDIOut.newByName("IAC Driver", "tidal1");

~midiOut.latency = 0;


s.options.numOutputBusChannels = 12;


//recording
s.record;

s.numChannels(4)
s.stopRecording;

s.makeGui;

/Users/jk/Documents/Music

// eigene samples laden
~dirt.loadSoundFiles("D:\\Musik\\Music\\tidal_samples\\*"); // specify sample folder to load

// output channels
s.options.numOutputBusChannels = 4;
~dirt.start(57120, [0, 4]);
~dirt = SuperDirt(2, s);


(
var busses = ~dirt.orbits.collect { |x| x.dryBus };

SynthDef(\readorb, { |out, amp = 1, n = 0| // number
	var bus, sound;


	bus = Select.kr(n, busses);
	sound = InFeedback.ar(bus, ~dirt.numChannels);
	//sound = CombL.ar(sound, 0.2, 0.03, 1);

	Out.ar(out,
		sound * (amp * 2.5)
	)
}).add;
);


