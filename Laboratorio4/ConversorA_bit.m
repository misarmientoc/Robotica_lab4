function [Bits] = ConversorA_bit(zeroGrad,value)
    Conversion = (299.71-150)/(1023-512);
    Grad_Bit = ((150+value)/Conversion)-512;
    %Bit2Grad = 90/Conversion;
    Bits = 512 + Grad_Bit + ((150+zeroGrad)/Conversion)-512;
    Bits = floor(Bits);
end

