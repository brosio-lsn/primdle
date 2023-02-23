architecture rtl of seg_decoder is
begin
   with digit select seg <= 
	"11111100" when "00",
	"01100000" when "01",
	"11011010" when "10",
	"11110010" when "11",
	"11111100" when others;
	
end architecture rtl;

