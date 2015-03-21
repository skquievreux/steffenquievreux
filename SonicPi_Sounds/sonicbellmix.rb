# little sonic pi sound by Steffen Quievreux

bpm = 200
p = 0.2
define :melody_1 do
    use_bpm =bpm
    play_pattern_timed [:d4, :c3,:c4, :d2,:e,:d2,:f2, :d3, :c4],[p,p*2,p,p,p,p]
end
define :melody_2 do
    use_bpm =bpm
    play_pattern_timed [:d5, :b3,:c3, :c4,:e,:d4,:f2, :d3, :c4],[p,p*2,p,p,p,p]
end

define :melody_3 do
   use_bpm =bpm
  variante= choose [:d4,:d3,:d2, :d5]
   play_pattern_timed [:d5, variante,:c4, :e2, variante,:d4,:f2, :c4, :c5],[p,p*2,p,p,p,p]
end


live_loop :pattern , amp: 0.4 do
sync :bass
  use_synth choose [:dull_bell,:dull_bell, :pretty_bell]
   melody_mix = choose [melody_1,melody_2,melody_3]
  melody_mix
end
#end

live_loop :echo do
  sync :pattern
  use_synth :dull_bell 
  melody_1 
end


live_loop :bass do
    sample :bd_tek
  wait 1
end