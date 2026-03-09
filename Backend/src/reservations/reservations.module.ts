import { Module } from '@nestjs/common';
import { ReservationController } from './reservations.controller';
import { ReservationService } from './reservations.service';
import { PrismaModule } from '../prisma/prisma.module';


@Module({
  controllers: [ReservationController],
  providers: [ReservationService],
  imports:[PrismaModule]
})
export class ReservationsModule {}
