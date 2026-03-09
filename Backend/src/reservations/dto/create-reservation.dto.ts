import { IsDateString, IsInt, IsNotEmpty } from 'class-validator';

export class CreateReservationDto {
  @IsDateString()
  @IsNotEmpty()
  date: string;

  @IsInt()
  @IsNotEmpty()
  patientId: number;
}
