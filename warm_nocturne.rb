# Made by Jens Kromdijk 25/06/2025#

set_volume! 0.5
use_bpm 80
use_random_seed 10

chords = [(chord :e, :minor), (chord :a, :minor), (chord :d, :major), (chord :b, :major)].ring
c = chords[0]

sample :ambi_lunar_land

live_loop :keys do
  with_fx :reverb do
    use_synth :growl
    play c, release: 4
    sleep 1
  end
end

live_loop :pew do
  with_fx :reverb do
    with_fx :tremolo do
      l = [1.5, 3].choose
      use_synth :hollow
      play c.choose, release: l
      sleep l
      play c.choose, release: 4 - l
      sleep 4 - l
    end
  end
end

live_loop :bass do
  with_fx :reverb do
    with_fx :slicer do
      with_fx :pan do
        t = 0
        use_synth :growl
        3.times do
          play c[0], release: rrand(0.8, 0.98), pan: 1
          ra = rrand(0.98, 1.02)
          sleep ra
          t += ra
        end
        play c[2], release: rrand(0.3, 0.48), pan: 1
        ra = rrand(0.48, 0.52)
        sleep 0.5
        t += ra
        play c[1], release: rrand(0.4, 0.5), pan: 1
        sleep 4 - t
        c = chords.tick
      end
    end
  end
end

live_loop :wibble do
  with_fx :tremolo do
    3.times do
      use_synth :mod_beep
      play c.choose, release: 0.67, cutoff: rrand(60, 110)
      sleep 0.66
    end
    sleep 0.02
  end
end

live_loop :fmbase do
  use_synth :fm
  with_fx :pan do
    with_fx :flanger do
      with_fx :compressor do
        play_pattern_timed [:e2, :a2, :d2, :b2], [4, 4, 4, 4], cutoff: 80, amp: 0.8, attack: 1, pan: -1
      end
    end
  end
end


live_loop :kick do
  with_fx :reverb do
    sample :bd_ada
    sleep 1
  end
end

live_loop :ambience do
  sleep rrand(5, 10)
end

in_thread do
  sleep 16.75
  8.times do
    sample :drum_snare_soft
    sleep 2
  end
end

in_thread do
  sleep 8.5
  120.times do
    sample :hat_bdu
    sleep 1
  end
end


in_thread do
  sleep 23.25
  8.times do
    sample :drum_tom_mid_hard
    sleep 2
  end
end

in_thread do
  sleep 33
  32.times do
    sample :drum_snare_hard, cutoff: 100
    sleep 2
  end
end

in_thread do
  sleep 48
  16.times do
    sample :drum_heavy_kick, cutoff: 100
    sleep 2
  end
end

in_thread do
  sleep 52.25
  52.times do
    sample :hat_star, cutoff: 100
    sleep 0.5
  end
end