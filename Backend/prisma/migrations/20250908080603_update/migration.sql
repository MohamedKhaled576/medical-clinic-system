/*
  Warnings:

  - You are about to drop the column `LocationAddress` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `PhoneNumber` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `PhoneNumber2` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `idnumber` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `Material` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[phonenumber]` on the table `Patient` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[phonenumber2]` on the table `Patient` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[locationnumber]` on the table `Patient` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[phone]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `locationnumber` to the `Patient` table without a default value. This is not possible if the table is not empty.
  - Added the required column `phonenumber` to the `Patient` table without a default value. This is not possible if the table is not empty.
  - Added the required column `phone` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "public"."Patient_LocationAddress_key";

-- DropIndex
DROP INDEX "public"."Patient_PhoneNumber2_key";

-- DropIndex
DROP INDEX "public"."Patient_PhoneNumber_key";

-- DropIndex
DROP INDEX "public"."User_idnumber_key";

-- AlterTable
ALTER TABLE "public"."Patient" DROP COLUMN "LocationAddress",
DROP COLUMN "PhoneNumber",
DROP COLUMN "PhoneNumber2",
ADD COLUMN     "locationnumber" TEXT NOT NULL,
ADD COLUMN     "phonenumber" TEXT NOT NULL,
ADD COLUMN     "phonenumber2" TEXT;

-- AlterTable
ALTER TABLE "public"."User" DROP COLUMN "idnumber",
ADD COLUMN     "phone" TEXT NOT NULL;

-- DropTable
DROP TABLE "public"."Material";

-- CreateIndex
CREATE UNIQUE INDEX "Patient_phonenumber_key" ON "public"."Patient"("phonenumber");

-- CreateIndex
CREATE UNIQUE INDEX "Patient_phonenumber2_key" ON "public"."Patient"("phonenumber2");

-- CreateIndex
CREATE UNIQUE INDEX "Patient_locationnumber_key" ON "public"."Patient"("locationnumber");

-- CreateIndex
CREATE UNIQUE INDEX "User_phone_key" ON "public"."User"("phone");
