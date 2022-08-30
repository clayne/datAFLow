declare compilation_options    "-single -scal -e echo_bug.dsp -o echo_bug.dsp";
declare library_path "/Documents/faust-github-faust2/tests/impulse-tests/dsp/echo_bug.dsp";
declare library_path "/usr/local/share/faust/sf.lib";
declare library_path "/usr/local/share/faust/all.lib";
declare library_path "/usr/local/share/faust/vaeffects.lib";
declare library_path "/usr/local/share/faust/synths.lib";
declare library_path "/usr/local/share/faust/spats.lib";
declare library_path "/usr/local/share/faust/soundfiles.lib";
declare library_path "/usr/local/share/faust/signals.lib";
declare library_path "/usr/local/share/faust/routes.lib";
declare library_path "/usr/local/share/faust/reverbs.lib";
declare library_path "/usr/local/share/faust/physmodels.lib";
declare library_path "/usr/local/share/faust/stdfaust.lib";
declare library_path "/usr/local/share/faust/phaflangers.lib";
declare library_path "/usr/local/share/faust/noises.lib";
declare library_path "/usr/local/share/faust/oscillators.lib";
declare library_path "/usr/local/share/faust/misceffects.lib";
declare library_path "/usr/local/share/faust/maths.lib";
declare library_path "/usr/local/share/faust/hoa.lib";
declare library_path "/usr/local/share/faust/filters.lib";
declare library_path "/usr/local/share/faust/envelopes.lib";
declare library_path "/usr/local/share/faust/dx7.lib";
declare library_path "/usr/local/share/faust/demos.lib";
declare library_path "/usr/local/share/faust/delays.lib";
declare library_path "/usr/local/share/faust/compressors.lib";
declare library_path "/usr/local/share/faust/basics.lib";
declare library_path "/usr/local/share/faust/analyzers.lib";
declare analyzers_lib_name "Faust Analyzer Library";
declare analyzers_lib_version "0.0";
declare basics_lib_name "Faust Basic Element Library";
declare basics_lib_version "0.0";
declare compressors_lib_name "Faust Compressor Effect Library";
declare compressors_lib_version "0.0";
declare delays_lib_name "Faust Delay Library";
declare delays_lib_version "0.1";
declare envelopes_lib_author "GRAME";
declare envelopes_lib_copyright "GRAME";
declare envelopes_lib_license "LGPL with exception";
declare envelopes_lib_name "Faust Envelope Library";
declare envelopes_lib_version "0.0";
declare filename "echo_bug";
declare filters_lib_name "Faust Filters Library";
declare filters_lib_version "0.0";
declare hoa_lib_author "Pierre Guillot";
declare hoa_lib_copyright "2012-2013 Guillot, Paris, Colafrancesco, CICM labex art H2H, U. Paris 8";
declare hoa_lib_name "High Order Ambisonics library";
declare maths_lib_author "GRAME";
declare maths_lib_copyright "GRAME";
declare maths_lib_license "LGPL with exception";
declare maths_lib_name "Faust Math Library";
declare maths_lib_version "2.1";
declare misceffects_lib_name "Faust Math Library";
declare misceffects_lib_version "2.0";
declare name "echo_bug";
declare noises_lib_name "Faust Noise Generator Library";
declare noises_lib_version "0.0";
declare oscillators_lib_name "Faust Oscillator Library";
declare oscillators_lib_version "0.0";
declare phaflangers_lib_name "Faust Phaser and Flanger Library";
declare phaflangers_lib_version "0.0";
declare reverbs_lib_name "Faust Reverb Library";
declare reverbs_lib_version "0.0";
declare routes_lib_name "Faust Signal Routing Library";
declare routes_lib_version "0.1";
declare signals_lib_name "Faust Signal Routing Library";
declare signals_lib_version "0.0";
declare soundfiles_lib_name "Faust Soundfile Library";
declare soundfiles_lib_version "0.4";
declare spats_lib_name "Faust Spatialization Library";
declare spats_lib_version "0.0";
declare synths_lib_name "Faust Synthesizer Library";
declare synths_lib_version "0.0";
declare vaeffects_lib_name "Faust Virtual Analog Filter Effect Library";
declare vaeffects_lib_version "0.0";
process = _<:_,(_ : (+ : _,0.0050000000000000044f : * : +~(_,0.995f : *)<:\(x1).(((x1,(1025,(0,100 : max) : min) : @),(1,(100,(100 : floor) : -) : -) : *),((x1,(1025,(0,101 : max) : min) : @),(100,(100 : floor) : -) : *) : +),\(x2).(((x2,(1025,(0,(100,(1.0f,(hslider("[0] EchoWarp", 0.0f, -1.0f, 1.0f, 0.001f) : _,1.0f : * : +~(_,0.0f : *)) : +) : * : _,1.0f : * : +~(_,0.0f : *) : int) : max) : min) : @),(1,((100,(1.0f,(hslider("[0] EchoWarp", 0.0f, -1.0f, 1.0f, 0.001f) : _,1.0f : * : +~(_,0.0f : *)) : +) : * : _,1.0f : * : +~(_,0.0f : *)),(100,(1.0f,(hslider("[0] EchoWarp", 0.0f, -1.0f, 1.0f, 0.001f) : _,1.0f : * : +~(_,0.0f : *)) : +) : * : _,1.0f : * : +~(_,0.0f : *) : floor) : -) : -) : *),((x2,(1025,(0,((100,(1.0f,(hslider("[0] EchoWarp", 0.0f, -1.0f, 1.0f, 0.001f) : _,1.0f : * : +~(_,0.0f : *)) : +) : * : _,1.0f : * : +~(_,0.0f : *) : int),1 : +) : max) : min) : @),((100,(1.0f,(hslider("[0] EchoWarp", 0.0f, -1.0f, 1.0f, 0.001f) : _,1.0f : * : +~(_,0.0f : *)) : +) : * : _,1.0f : * : +~(_,0.0f : *)),(100,(1.0f,(hslider("[0] EchoWarp", 0.0f, -1.0f, 1.0f, 0.001f) : _,1.0f : * : +~(_,0.0f : *)) : +) : * : _,1.0f : * : +~(_,0.0f : *) : floor) : -) : *) : +))~((_,0 : *),!) : !,_) : +;
