import { Injectable, NotFoundException } from '@nestjs/common';
import { UpdatePatientDto } from './dto/update-patient.dto';
import { PrismaService } from '../prisma/prisma.service';
import { CreatePatientDto } from './dto/create-patient.dto';


@Injectable()
export class PatientService {
  constructor(private prisma: PrismaService) {}

  async create(createPatientDto: CreatePatientDto) {
    return this.prisma.patient.create({
      data: createPatientDto,
    });
  }

  async findAll() {
    return  this.prisma.patient.findMany({
      include: { reservations: true },
    });
  }

  async findOne(id: number) {
    const patient = await this.prisma.patient.findUnique({
      where: { id },
      include: { reservations: true },
    });
    if (!patient) {
      throw new NotFoundException(`Patient with ID "${id}" not found.`);
    }
    return patient;
  }

  // Add the update method
  async update(id: number, updatePatientDto: UpdatePatientDto) {
    // You can also add checks here to handle cases where the patient does not exist.
    await this.findOne(id); // Use the existing findOne method to check for existence
    return this.prisma.patient.update({
      where: { id },
      data: updatePatientDto,
    });
  }

  // Add the remove method
  async remove(id: number) {
    await this.findOne(id); // Use the existing findOne method to check for existence
    return this.prisma.patient.delete({
      where: { id },
    });
  }
}