import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class UsersService {
  constructor(private prisma: PrismaService) {}

  async create(createUserDto: CreateUserDto) {
    return this.prisma.user.create({
      data: createUserDto,
    });
  }

  async findAll() {
    return  this.prisma.user.findMany();
  }

  async findOne(id: number) {
    const user = await this.prisma.user.findUnique({
      where: { id } });
    if (!user) {
      throw new NotFoundException(`User with ID "${id}" not found.`);
    }
    return user;
  }

  // Add the update method
  async update(id: number, updateUserDto: UpdateUserDto) {
    await this.findOne(id); // Use the existing findOne method to check for existence
    return this.prisma.user.update({
      where: { id },
      data: updateUserDto,
    });
  }

  // Add the remove method
  async remove(id: number) {
    await this.findOne(id); // Use the existing findOne method to check for existence
    return this.prisma.user.delete({
      where: { id },
    });
  }
}