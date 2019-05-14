#Copy and paste this into Sonic Pi if possible
use_bpm 90

#change locations to your local device
kick = "/Users/Lauren/Documents/Processing/Final/Samples/kick.wav"
clap = "/Users/Lauren/Documents/Processing/Final/Samples/clap.wav"
piano = "/Users/Lauren/Documents/Processing/Final/Samples/jazz-piano.wav"
lolo = "/Users/Lauren/Documents/Processing/Final/Samples/lolo.wav"

live_loop :kick do
sample kick
sleep 2
end

live_loop :kick do
sample lolo
sleep 2
end

live_loop :clap do
with_fx :lpf, cutoff: 95, mix: 1 do
sleep 1
sample clap
sleep 1
end
end

live_loop :piano do
with_fx :reverb, room: 0.75, mix: 1 do
sync :kick
sample piano, pan: 0.25, rate: 0.8, finish: 0.1, amp: 1.5
sleep 3
end
end

#fast moving sound
live_loop :pad do
with_synth :dark_ambience do
play_pattern_timed scale(:ab3, :major), 0.125, release: 0.1, amp: 2
sleep 8
end
end

live_loop :hiss do
sample :vinyl_hiss, amp: 0.1
sleep 0.50
end

live_loop :hat do
sleep 0.50
sample :drum_cymbal_closed
sleep 0.50
end

live_loop :second_synth do
with_fx :reverb, mix: 0.7 do
with_synth :fm do
notes = (ring 56, 70)
play notes, attack: 2, release: 2
sleep 8
end
end
end
