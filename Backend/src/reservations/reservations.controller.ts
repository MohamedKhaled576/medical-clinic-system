import {
  Controller,
  Get,
  Post,
  Body,
  Param,
  ParseIntPipe,
} from '@nestjs/common';
import { ReservationService, } from './reservations.service';
import { CreateReservationDto } from './dto/create-reservation.dto';


@Controller('reservations')
export class ReservationController {
  constructor(private readonly reservationService: ReservationService) {}

  @Post()
  create(@Body() createReservationDto: CreateReservationDto) {
    return this.reservationService.create(createReservationDto);
  }

  @Get('patient/:id')
  findAllByPatient(@Param('id', ParseIntPipe) patientId: number) {
    return this.reservationService.findAllByPatient(patientId);
  }
}