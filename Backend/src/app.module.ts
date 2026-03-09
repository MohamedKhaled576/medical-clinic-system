import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';
import { UsersModule } from './users/users.module';
import { PatientsModule } from './patients/patients.module';
import { ReservationsModule } from './reservations/reservations.module';
import { MedsModule } from './meds/meds.module';

@Module({
  imports: [PrismaModule, UsersModule, PatientsModule, ReservationsModule, MedsModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
