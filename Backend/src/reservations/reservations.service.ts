import { Injectable } from '@nestjs/common';
import { CreateReservationDto } from './dto/create-reservation.dto';
import { PrismaService } from '../prisma/prisma.service';


@Injectable()
export class ReservationService {
  constructor(private prisma: PrismaService) {}

  async create(createReservationDto: CreateReservationDto) {
    return  this.prisma.reservation.create({
      data: {
        date: new Date(createReservationDto.date),
        patientId: createReservationDto.patientId,
      },
    });
  }

  async findAllByPatient(patientId: number) {
    return  this.prisma.reservation.findMany({
      where: { patientId },
    });
  }
}