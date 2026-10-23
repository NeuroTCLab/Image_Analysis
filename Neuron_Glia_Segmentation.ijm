input = "D:/2025-2026/Tai/100626_Neuron_Glia/Folder_20260610/019_Exo_pH4/GFAP/";
output = "D:/2025-2026/Tai/100626_Neuron_Glia/Folder_20260610/019_Exo_pH4/GFAP_Segmentation/";
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
		run("Analyze Particles...", "size=10-Infinity display include summarize overlay add composite");
		saveAs("Tiff", output + "Segmented_" + filename);
}
