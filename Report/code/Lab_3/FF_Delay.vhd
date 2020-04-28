architecture PLUTO of FD is -- flip flop D con reset ASINCRONO

begin
	
	PASYNCH: process(CK,RESET)
	begin
	  if RESET='1' then
	    Q <= '0';
	  elsif CK'event and CK='1' then -- positive edge triggered:
	    Q <= D after 0.1 ps; -- copia l'ingresso sull'uscita
	  end if;
	end process;

end PLUTO;