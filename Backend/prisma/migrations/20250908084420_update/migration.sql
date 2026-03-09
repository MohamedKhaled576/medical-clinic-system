/*
  Warnings:

  - You are about to drop the column `locationnumber` on the `Patient` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[locationaddress]` on the table `Patient` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `locationaddress` to the `Patient` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "public"."Patient_locationnumber_key";

-- AlterTable
ALTER TABLE "public"."Patient" DROP COLUMN "locationnumber",
ADD COLUMN     "locationaddress" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Patient_locationaddress_key" ON "public"."Patient"("locationaddress");
