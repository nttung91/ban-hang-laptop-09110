
function selectType(div){
	var loai = document.getElementById('Loaisp');
	var adiv = document.getElementById('linhkien_icon');
			
		var bdiv = document.getElementById('laptop_icon');
	//TH1: neu click vao laptop
	if (div.id=='laptop_icon'){
			//TH11:neu laptop chua dc chon
			if (div.style.borderStyle=="dotted"){
				div.style.backgroundSize="100% 100%";
	div.style.borderStyle = "solid";
				//kiem tra xem doi tuong con lai co duoc chon ko
				if (adiv.style.borderStyle=="solid"){
						loai.value = "All";
						
					}
					//doi tuong con lai ko dc chon
					else {
							loai.value = "Laptop";
						}
				//neu laptop dc chon
				}else {
					//doi tuong con lai cung dc chon roi thi bo wa
					if (adiv.style.borderStyle!="dotted"){
							div.style.backgroundSize = "80% 80%";
							div.style.borderStyle = "dotted";
							loai.value = "LinhKien"
						}
						
					}
				
		
		}
		else {
			
		if (div.style.borderStyle=="dotted"){
				div.style.backgroundSize="100% 100%";
	div.style.borderStyle = "solid";
	if (bdiv.style.borderStyle=="solid"){
						loai.value = "All";
						
					}
					//doi tuong con lai ko dc chon
					else {
							loai.value = "LinhKien";
						}
				}else {
					if (bdiv.style.borderStyle!="dotted"){
							div.style.backgroundSize = "80% 80%";
							div.style.borderStyle = "dotted";
							loai.value = "Laptop"
						}
					}
		}
		alert(loai.value);
}
	