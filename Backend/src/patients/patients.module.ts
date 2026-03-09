import { Module } from '@nestjs/common';
import { PatientController } from './patients.controller';
import { PatientService } from './patients.service';
import { PrismaModule } from '../prisma/prisma.module';


@Module({
  controllers: [PatientController],
  providers: [PatientService],
  imports:[PrismaModule]
})
export class PatientsModule {}
