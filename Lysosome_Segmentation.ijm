input = "D:/2025-2026/Tai/270526_GBAExo_iNeuron_Lyso/270526_GBAExo_iNeuron_Lyso/023_pH4/";
output = "D:/2025-2026/Tai/270526_GBAExo_iNeuron_Lyso/270526_GBAExo_iNeuron_Lyso/023_pH4_Segmentation/";
setBatchMode(true);
list = getFileList(input);
for (i = 0; i < list.length; i++){
		action(input, output, list[i]);
}
setBatchMode(false);
function action (input, output, filename) {
		open(input + filename);
		run("Subtract Background...", "rolling=50");
		run("Median...", "radius=2");
		run("Auto Threshold", "method=Default white");
		run("Watershed");
		run("Analyze Particles...", "display include summarize overlay add composite");
		saveAs("Tiff", output + "Segmented_" + filename);
}