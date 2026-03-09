import {
  IsNotEmpty,
  IsOptional,
  IsString,
} from 'class-validator';

export class CreatePatientDto {
  @IsString()
  @IsNotEmpty()
  name: string;

  @IsNotEmpty()
  phonenumber: string;

  @IsOptional()
  phonenumber2?: string;

  @IsString()
  @IsNotEmpty()
  locationaddress: string;


}