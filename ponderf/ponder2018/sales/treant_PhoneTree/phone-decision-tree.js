// // // // // // // // // // // // // // // // // // // // // // // //

var config = {
	container: "#DecisionTree",

	animateOnInit: true,
	scrollbar: "fancy",

	node: {
		HTMLclass: 'long-choice'
	},
	animation: {
		nodeAnimation: "easeOutBounce",
		nodeSpeed: 700,
		connectorsAnimation: "bounce",
		connectorsSpeed: 700
	}
};

var parent_node = {
	HTMLclass: 'prompt',
	HTMLid: "root",
	text: { name: "What brand phone would the customer prefer?" }
};

var iPhone = {
	parent: parent_node,
	HTMLclass: 'short-choice',
	collapsed: true,
	HTMLid: "iPhone",
	text: { name: "iPhone" }
}

var compactIP = {
	parent: iPhone,
	HTMLclass: 'med-choice',
	collapsed: true,
	text: { name: "Compact Display" }
}

var iPhoneSE = {
	parent: compactIP,
	HTMLclass: 'short-final',
	HTMLid: "iPhoneSE2020",
	text: { name: "iPhone SE 2020" }
}

var mediumIP = {
	parent: iPhone,
	collapsed: true,
	HTMLclass: 'med-choice',
	HTMLid: "mediumIP",
	text: { name: "Medium Display" }
}

var lcd = {
	parent: mediumIP,
	collapsed: true,
	HTMLclass: 'short-choice',
	text: { name: "LCD" }
}

var optionIP11 = {
	parent: lcd,
	collapsed: true,
	HTMLclass: 'nodeHighCost',
	text: {
		name: "Newest Processor",
		title: "Enhanced Cameras",
		desc: "Higher Cost"
	}
}

var iPhone11 = {
	parent: optionIP11,
	HTMLclass: 'short-final',
	text: { name: "iPhone 11" }
}

var optionIPXR = {
	parent: lcd,
	collapsed: true,
	HTMLclass: 'nodeLowCost',
	text: {
		name: "Older Processor",
		title: "Standard Cameras",
		desc: "Lower Cost"
	}
}

var iPhoneXR = {
	parent: optionIPXR,
	HTMLclass: 'short-final',
	text: { name: "iPhone XR" }
}

var oled = {
	parent: mediumIP,
	collapsed: true,
	HTMLclass: 'med-choice',
	text: { name: "OLED Display" }
}

var optionIP11Pro = {
	parent: oled,
	collapsed: true,
	HTMLclass: 'nodeHighCost',
	text: {
		name: "Enhanced Camera",
		title: "Extended Battery",
		desc: "Higher Cost"
	}
}

var iPhone11Pro = {
	parent: optionIP11Pro,
	HTMLclass: 'short-final',
	text: { name: "iPhone 11 Pro" }
}

var optionIPXS = {
	parent: oled,
	collapsed: true,
	HTMLclass: 'nodeLowCost',
	text: {
		name: "Standard Camera",
		title: "Standard Battery",
		desc: "Lower Cost"
	}
}

var iPhoneXS = {
	parent: optionIPXS,
	HTMLclass: 'short-final',
	text: { name: "iPhone XS" }
}

var largeIP = {
	parent: iPhone,
	collapsed: true,
	HTMLclass: 'med-choice',
	text: { name: "Large Display" }
}

var optionIP11PM = {
	parent: largeIP,
	collapsed: true,
	HTMLclass: 'nodeHighCost',
	text: {
		name: "Newer Processor",
		title: "Extended Battery",
		desc: "Higher Cost"
	}
}

var iPhone11PM = {
	parent: optionIP11PM,
	HTMLclass: 'long-final',
	text: { name: "iPhone 11 Pro Max" }
}

var optionIPXSM = {
	parent: largeIP,
	collapsed: true,
	HTMLclass: 'nodeLowCost',
	text: {
		name: "Older Processor",
		title: "Standard Battery",
		desc: "Lower Cost"
	}
};

var iPhoneXSM = {
	parent: optionIPXSM,
	HTMLclass: 'short-final',
	text: { name: "iPhone XS Max" }
};

var android = {
	parent: parent_node,
	collapsed: true,
	HTMLclass: "med-choice",
	text: { name: "Samsung" }
};

var noSpen = {
	parent: android,
	collapsed: true,
	childrenDropLevel: 6,
	HTMLclass: 'med-choice',
	text: { name: "No Stylus" }
};

var no5G = {
	parent: noSpen,
	collapsed: true,
	HTMLclass: "med-choice",
	text: {
		name: "4G/LTE",
		title: "(No 5G Support)"
	}
};

var compactS = {
	parent: no5G,
	collapsed: true,
	HTMLclass: "med-choice",
	text: { name: "Compact Display" }
};

var optionS9 = {
	parent: compactS,
	collapsed: true,
	HTMLclass: 'nodeLowCost',
	text: {
		name: "Older Processor",
		title: "Standard Cameras",
		desc: "Lower Cost"
	}
};

var s9 = {
	parent: optionS9,
	HTMLclass: 'short-final',
	text: { name: "Galaxy S9" }
};

var optionS10e = {
	parent: compactS,
	collapsed: true,
	HTMLclass: 'nodeHighCost',
	text: {
		name: "Newest Processor",
		title: "Enhanced Cameras",
		desc: "Higher Cost"
	}
};

var s10e = {
	parent: optionS10e,
	HTMLclass: 'short-final',
	text: { name: "Galaxy S10e" }
};

var mediumS = {
	parent: no5G,
	collapsed: true,
	HTMLclass: "med-choice",
	text: { name: "Medium Display" }
};

var optionS10 = {
	parent: mediumS,
	collapsed: true,
	HTMLclass: 'nodeLowCost',
	text: {
		name: "Standard Battery",
		title: "Standard Front Camera",
		desc: "Lower Cost"
	}
};

var s10 = {
	parent: optionS10,
	HTMLclass: 'short-final',
	text: { name: "Galaxy S10" }
};

var optionS10P = {
	parent: mediumS,
	collapsed: true,
	HTMLclass: 'nodeHighCost',
	text: {
		name: "Extended Battery",
		title: "Enhanced Front Camera",
		desc: "Higher Cost"
	}
};

var s10P = {
	parent: optionS10P,
	HTMLclass: 'short-final',
	text: { name: "Galaxy S10+" }
};

var largeS = {
	parent: no5G,
	collapsed: true,
	HTMLclass: "med-choice",
	text: { name: "Large Display" }
};

var s10L = {
	parent: largeS,
	HTMLclass: 'long-final',
	text: { name: "Galaxy S10 Lite" }
};

var partial5G = {
	parent: noSpen,
	collapsed: true,
	HTMLclass: "med-choice",
	text: { name: "5G Support" }
};

var s205G = {
	parent: partial5G,
	HTMLclass: 'long-final',
	text: { name: "Galaxy S20 5G" }
};

var full5G = {
	parent: noSpen,
	collapsed: true,
	HTMLclass: 'long-choice',
	text: { name: "Faster 5G Plus Support" }
};

var optionS20P = {
	parent: full5G,
	collapsed: true,
	HTMLclass: 'nodeLowCost',
	text: {
		name: "Large Display",
		title: "Standard Cameras",
		desc: "Lower Cost"
	}
}

var s20P = {
	parent: optionS20P,
	HTMLclass: 'long-final',
	text: { name: "Galaxy S20+ 5G" }
}

var optionS20U = {
	parent: full5G,
	collapsed: true,
	HTMLclass: 'nodeHighCost',
	text: {
		name: "Larger Display",
		title: "Enhanced Cameras",
		desc: "Higher Cost"
	}
}

var s20U = {
	parent: optionS20U,
	HTMLclass: 'long-final',
	text: { name: "Galaxy S20 Ultra 5G" }
}

var gnote = {
	parent: android,
	collapsed: true,
	childrenDropLevel: 3,
	HTMLclass: 'short-choice',
	text: { name: "Stylus" }
};

var no5G2 = {
	parent: gnote,
	collapsed: true,
	HTMLclass: 'med-choice',
	text: {
		name: "4G/LTE",
		title: "(No 5G Support)"
	}
};

var optionN9 = {
	parent: no5G2,
	collapsed: true,
	HTMLclass: 'nodeLowCost',
	text: {
		name: "Standard Cameras",
		title: "No Expandable Memory",
		desc: "Lower Cost"
	}
}

var n9 = {
	parent: optionN9,
	HTMLclass: 'short-final',
	text: { name: "Galaxy Note9" }
}

var optionN10 = {
	parent: no5G2,
	collapsed: true,
	HTMLclass: 'nodeHighCost',
	text: {
		name: "Enhanced Cameras",
		title: "No Expandable Memory",
		desc: "Higher Cost"
	}
}

var n10 = {
	parent: optionN10,
	HTMLclass: 'short-final',
	text: { name: "Galaxy Note10" }
}

var optionN10P = {
	parent: no5G2,
	collapsed: true,
	HTMLclass: 'nodeHighCost',
	text: {
		name: "Enhanced Cameras",
		title: "Expandable Memory",
		desc: "Highest Cost"
	}
}

var n10P = {
	parent: optionN10P,
	HTMLclass: 'short-final',
	text: { name: "Galaxy Note10+" }
}

var partial5G2 = {
	parent: gnote,
	collapsed: true,
	HTMLclass: 'med-choice',
	text: { name: "5G Support" }
};

var n10P5G = {
	parent: partial5G2,
	HTMLclass: 'long-final',
	text: { name: "Galaxy Note10+ 5G" }
}

var full5G2 = {
	parent: gnote,
	collapsed: true,
	HTMLclass: 'long-choice',
	text: { name: "Faster 5G Plus Support" }
};

var optionN20 = {
	parent: full5G2,
	collapsed: true,
	HTMLclass: 'nodeLowCost',
	text: {
		name: "No Expandable Memory",
		title: "Smaller Display",
		desc: "Lower Cost"
	}
}

var n20 = {
	parent: optionN20,
	HTMLclass: 'long-final',
	text: { name: "Galaxy Note20 5G" }
}

var optionN20U = {
	parent: full5G2,
	collapsed: true,
	HTMLclass: 'nodeHighCost',
	text: {
		name: "Expandable Memory",
		title: "Larger Display",
		desc: "Higher Cost"
	}
}

var n20U = {
	parent: optionN20U,
	HTMLclass: 'long-final',
	text: { name: "Galaxy Note20 Ultra 5G" }
}

var simple_chart_config = [
	config, parent_node, iPhone, compactIP, iPhoneSE, mediumIP, lcd, oled,
	optionIPXR, optionIP11, optionIPXS, optionIP11Pro, iPhoneXR,
	iPhone11, iPhoneXS, iPhone11Pro,
	largeIP, optionIPXSM, optionIP11PM, iPhoneXSM, iPhone11PM,
	android, gnote, no5G2, optionN9, n9, optionN10, n10, optionN10P, n10P,
	partial5G2, n10P5G, full5G2, optionN20, n20, optionN20U, n20U, noSpen, no5G,
	compactS, optionS9, s9, optionS10e, s10e,
	mediumS, optionS10, s10, optionS10P, s10P, largeS, s10L, partial5G, s205G, full5G,
	optionS20P, s20P, optionS20U, s20U
];
