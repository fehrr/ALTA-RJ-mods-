var settingPreset = false;

// Just a wrapper for the JQ post method
const sendNuiEvent = (name, data, callback) => {
	$.post(`https://radio/${name}`, JSON.stringify(data), callback);
}


// Event listeners
window.addEventListener('message', function(event) {
	const data = event.data;
	if (data.action == 'open') {
		$('.wrapper').fadeIn();
	}
});

window.addEventListener('keyup', function(e) {
	if (e.code == 'Escape' && $('.wrapper').is(':visible')) {
		$('.wrapper').fadeOut();
		sendNuiEvent('close');
		settingPreset = false;
	};
});


// Radio control functions
const toggleRadio = (join) => {
	var channel = $('#radio-channel').val();
	if (join && channel.length) {
		sendNuiEvent('join', {channel});
	} else if (!join) {
		sendNuiEvent('leave');
		$('#radio-channel').val('');
	}
}

const changeVolume = (type) => {
	sendNuiEvent(`volume_${type}`);
}

const presetChannel = (preset) => {
	if (settingPreset) {
		sendNuiEvent('preset_set', {preset});
		settingPreset = false;
	} else {
		sendNuiEvent('preset_join', {preset}, function(frequency) {
			$('#radio-channel').val(frequency);
		});
	}
}

const setPreset = () => {
	var channel = $('#radio-channel').val();
	if (channel.length) {
		sendNuiEvent('preset_request', {channel});
		settingPreset = true;
	}
}
